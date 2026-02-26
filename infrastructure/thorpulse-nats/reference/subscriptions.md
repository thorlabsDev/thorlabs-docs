# Subscriptions

This document covers all subscription methods and filtering options available in ThorPulse.

## Simple Subscriptions

Simple subscriptions connect directly to NATS topic patterns. They're easy to use but don't support server-side filtering.

### Slots

{% code title="Go" %}
```go
// All slot updates
slots := client.SubscribeSlotsChannel(ctx)

// Confirmed slots only
slots := client.SubscribeSlotsConfirmedChannel(ctx)
```
{% endcode %}

Topic patterns:

* `slots.>` - All slot events
* `slots.*.confirmed` - Confirmed slots only
* `slots.*.finalized` - Finalized slots only
* `slots.{slot_number}.{status}` - Specific slot

### Transactions

{% code title="Go" %}
```go
// All transactions (high volume!)
txs := client.SubscribeAllTransactionsChannel(ctx)

// By program
txs := client.SubscribeProgramChannel(ctx, "675kPX9MHTjS2zt1qfr1NYHuzeLXfQM9H24wFSUt1Mp8")

// By account
txs := client.SubscribeAccountTransactionsChannel(ctx, pubkey)
```
{% endcode %}

Topic patterns:

* `txs.slot.>` - All transactions
* `txs.program.{program_id}.>` - By program
* `txs.account.{pubkey}.>` - By account
* `txs.sig.{signature}.{slot}` - Specific transaction

### Entries

{% code title="Go" %}
```go
entries := client.SubscribeEntriesChannel(ctx)
```
{% endcode %}

Topic patterns:

* `entries.>` - All entries
* `entries.{slot}.{index}` - Specific entry

### Accounts

{% code title="Go" %}
```go
// All accounts (very high volume!)
accounts := client.SubscribeAccountsChannel(ctx)
```
{% endcode %}

Topic patterns:

* `accounts.>` - All account updates
* `accounts.pubkey.{pubkey}.{slot}` - Specific account
* `accounts.owner.{program}.{slot}` - By owner program

## SubscribeRequest (Yellowstone-Style)

`SubscribeRequest` enables server-side filtering, reducing bandwidth and latency. It's the recommended approach for production.

### Basic Usage

{% code title="Go" %}
```go
request := client.NewSubscribeRequest().
    AllSlots("my-slots").
    Transactions("my-txs", client.TransactionFilter{
        Vote: boolPtr(false),
    }).
    Entries("my-entries").
    Commitment(client.CommitmentConfirmed)

subscription, err := client.Subscribe(ctx, request)
```
{% endcode %}

### Filter Types

#### Slot Filter

{% code title="Go" %}
```go
request.Slots("slot-filter", client.SlotFilter{
    FilterByCommitment: true,  // Only at commitment level
})

// Shorthand for all slots
request.AllSlots("all-slots")
```
{% endcode %}

#### Transaction Filter

{% code title="Go" %}
```go
request.Transactions("tx-filter", client.TransactionFilter{
    Vote:            boolPtr(false),     // Exclude votes
    Failed:          boolPtr(false),     // Only successful
    Signature:       "5UGT...",          // Specific signature
    AccountInclude:  []string{"675k..."}, // Include if ANY match
    AccountExclude:  []string{"Vote..."}, // Exclude if ANY match
    AccountRequired: []string{"Toke..."}, // Require ALL
})
```
{% endcode %}

| Field           | Type      | Description                             |
| --------------- | --------- | --------------------------------------- |
| Vote            | \*bool    | true=votes only, false=non-votes only   |
| Failed          | \*bool    | true=failed only, false=successful only |
| Signature       | string    | Filter for specific signature           |
| AccountInclude  | \[]string | Include if ANY account present          |
| AccountExclude  | \[]string | Exclude if ANY account present          |
| AccountRequired | \[]string | Require ALL accounts present            |

#### Account Filter

{% code title="Go" %}
```go
request.Accounts("acc-filter", client.AccountFilter{
    Accounts: []string{"pubkey1", "pubkey2"}, // Specific accounts
    Owners:   []string{"TokenkegQf..."},      // By owner program
    Filters: []client.AccountDataFilter{
        {Datasize: uint64Ptr(165)},           // By data size
        {Memcmp: &client.MemcmpFilter{
            Offset: 0,
            Bytes:  []byte{1, 2, 3},
        }},
        {TokenAccountState: true},            // SPL tokens only
        {Lamports: &client.LamportsFilter{
            Eq: uint64Ptr(0),                 // Zero balance
        }},
    },
})
```
{% endcode %}

| Filter            | Description                   |
| ----------------- | ----------------------------- |
| Datasize          | Match exact account data size |
| Memcmp            | Match bytes at offset         |
| TokenAccountState | Only valid SPL token accounts |
| Lamports.Eq       | Exact lamport balance         |
| Lamports.Ne       | Not equal to balance          |
| Lamports.Lt       | Less than balance             |
| Lamports.Gt       | Greater than balance          |

#### Entry Filter

{% code title="Go" %}
```go
request.Entries("entry-filter")
```
{% endcode %}

Entries don't have filter options - you receive all entries or none.

#### Block Filter

{% code title="Go" %}
```go
request.Blocks("block-filter", client.BlockFilter{
    AccountInclude:      []string{},
    IncludeTransactions: true,
    IncludeAccounts:     false,
    IncludeEntries:      false,
})
```
{% endcode %}

#### Block Meta Filter

{% code title="Go" %}
```go
request.BlocksMeta("meta-filter")
```
{% endcode %}

Block metadata is lighter than full blocks - contains slot, blockhash, parent, rewards summary.

### Commitment Levels

{% code title="Go" %}
```go
request.Commitment(client.CommitmentProcessed)  // Fastest, may rollback
request.Commitment(client.CommitmentConfirmed)  // Balanced
request.Commitment(client.CommitmentFinalized)  // Slowest, irreversible
```
{% endcode %}

| Level     | Description                     | Use Case               |
| --------- | ------------------------------- | ---------------------- |
| Processed | Transaction processed by leader | Real-time display      |
| Confirmed | Confirmed by supermajority      | Trading, analytics     |
| Finalized | Guaranteed irreversible         | Settlement, accounting |

## Handling Updates

### Go Handler Pattern

{% code title="Go" %}
```go
err := subscription.Run(ctx, func(update *proto.SubscribeUpdate) error {
    switch u := update.UpdateOneof.(type) {
    case *proto.SubscribeUpdate_Slot:
        fmt.Printf("Slot: %d\n", u.Slot.Slot)
    case *proto.SubscribeUpdate_Transaction:
        fmt.Printf("TX: %x\n", u.Transaction.Transaction.Signature[:8])
    case *proto.SubscribeUpdate_Account:
        fmt.Printf("Account: %x\n", u.Account.Account.Pubkey[:8])
    case *proto.SubscribeUpdate_Entry:
        fmt.Printf("Entry: slot %d index %d\n", u.Entry.Slot, u.Entry.Index)
    case *proto.SubscribeUpdate_Block:
        fmt.Printf("Block: %d\n", u.Block.Slot)
    case *proto.SubscribeUpdate_Pong:
        // Keep-alive, ignore
    }
    return nil
})
```
{% endcode %}

### Rust Stream Pattern

{% code title="Rust" %}
```rust
use futures::StreamExt;
use thorpulse_client::proto::subscribe_update::UpdateOneof;

while let Some(result) = subscription.next().await {
    let update = result?;
    match update.update_oneof {
        Some(UpdateOneof::Slot(slot)) => {
            println!("Slot: {}", slot.slot);
        }
        Some(UpdateOneof::Transaction(tx)) => {
            println!("TX in slot: {}", tx.slot);
        }
        Some(UpdateOneof::Account(acc)) => {
            println!("Account in slot: {}", acc.slot);
        }
        Some(UpdateOneof::Entry(entry)) => {
            println!("Entry: {} / {}", entry.slot, entry.index);
        }
        Some(UpdateOneof::Pong(_)) => {
            // Keep-alive
        }
        _ => {}
    }
}
```
{% endcode %}

## Performance Considerations

### Subscription Limits

Each tier has subscription limits:

* Flash: 100 concurrent subscriptions
* Thor: 250 concurrent subscriptions
* Prime: Unlimited

### Topic Selection

Start specific, widen if needed:

{% stepper %}
{% step %}
**Specific account/program subscriptions**

Lowest bandwidth: subscribe to specific accounts or programs.
{% endstep %}

{% step %}
**SubscribeRequest with filters**

Server-side filtering reduces client bandwidth and latency.
{% endstep %}

{% step %}
**Simple topic subscriptions**

Client-side filtering on topic subscriptions; broader than filtered SubscribeRequest.
{% endstep %}

{% step %}
**Wildcard subscriptions**

Highest bandwidth: use only when you need broad coverage.
{% endstep %}
{% endstepper %}

### Buffer Sizing

For high-volume subscriptions:

{% code title="Go" %}
```go
// Go: Use buffered channels
slots := make(chan *proto.SubscribeUpdateSlot, 1000)
```
{% endcode %}

{% code title="Rust" %}
```rust
// Rust: Process quickly or buffer
let (tx, rx) = tokio::sync::mpsc::channel(1000);
```
{% endcode %}

### Backpressure

If you can't keep up:

{% stepper %}
{% step %}
**The NATS connection buffers messages**

This provides temporary buffering while you catch up.
{% endstep %}

{% step %}
**Eventually, slow consumers are disconnected**

If buffers overflow or consumers are too slow, NATS will disconnect them.
{% endstep %}

{% step %}
**Use client.Stats() to monitor buffer usage**

Monitor and react programmatically to growing buffers.
{% endstep %}
{% endstepper %}

## Common Patterns

### DEX Trading

{% code title="Go" %}
```go
request := client.NewSubscribeRequest().
    AllSlots("slots").
    Transactions("raydium", client.TransactionFilter{
        Vote:           boolPtr(false),
        Failed:         boolPtr(false),
        AccountInclude: []string{
            "675kPX9MHTjS2zt1qfr1NYHuzeLXfQM9H24wFSUt1Mp8", // Raydium AMM
        },
    }).
    Commitment(client.CommitmentConfirmed)
```
{% endcode %}

### Token Monitoring

{% code title="Go" %}
```go
request := client.NewSubscribeRequest().
    Accounts("tokens", client.AccountFilter{
        Owners: []string{"TokenkegQfeZyiNwAJbNbGKPFXCWuBvf9Ss623VQ5DA"},
        Filters: []client.AccountDataFilter{
            {Datasize: uint64Ptr(165)}, // Token account size
        },
    }).
    Commitment(client.CommitmentConfirmed)
```
{% endcode %}

### Wallet Tracking

{% code title="Go" %}
```go
wallets := []string{"wallet1...", "wallet2...", "wallet3..."}

request := client.NewSubscribeRequest().
    Accounts("wallets", client.AccountFilter{
        Accounts: wallets,
    }).
    Transactions("wallet-txs", client.TransactionFilter{
        AccountInclude: wallets,
    })
```
{% endcode %}
