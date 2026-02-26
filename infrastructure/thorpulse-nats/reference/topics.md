# Topics

ThorPulse publishes data to NATS topics following a hierarchical naming convention. This document provides the complete topic schema.

## Topic Structure

Topics follow the pattern: `{type}.{identifiers}.{slot}`

NATS wildcards:

* `*` matches a single token (e.g., `slots.*.confirmed`)
* `>` matches one or more tokens (e.g., `slots.>`)

## Slot Topics

Slot status updates as the network processes blocks.

### Pattern

{% code title="Pattern" %}
```
slots.{slot}.{status}
```
{% endcode %}

### Statuses

| Status                 | Description                              |
| ---------------------- | ---------------------------------------- |
| `first_shred_received` | First shred for this slot was received   |
| `completed`            | All shreds received, slot is complete    |
| `processed`            | Slot has been processed by the validator |
| `confirmed`            | Slot has been confirmed by the cluster   |
| `finalized`            | Slot has been finalized (irreversible)   |
| `created_bank`         | Bank was created for this slot           |
| `dead`                 | Slot was marked as dead (fork)           |

### Examples

{% code title="Examples" %}
```
slots.234567890.first_shred_received
slots.234567890.completed
slots.234567890.processed
slots.234567890.confirmed
slots.234567890.finalized
```
{% endcode %}

### Subscription Patterns

| Pattern             | Description                   |
| ------------------- | ----------------------------- |
| `slots.>`           | All slot updates              |
| `slots.*.confirmed` | Only confirmed slots          |
| `slots.*.finalized` | Only finalized slots          |
| `slots.234567890.*` | All updates for specific slot |

***

## Transaction Topics

Transaction data published to multiple topics for flexible querying.

### By Signature

{% code title="Pattern" %}
```
txs.sig.{signature}.{slot}
```
{% endcode %}

Query a specific transaction by its base58 signature.

### By Slot

{% code title="Pattern" %}
```
txs.slot.{slot}
```
{% endcode %}

All transactions in a specific slot.

### By Program

{% code title="Pattern" %}
```
txs.program.{program_id}.{slot}
```
{% endcode %}

Transactions that executed a specific program.

### By Account

{% code title="Pattern" %}
```
txs.account.{pubkey}.{slot}
```
{% endcode %}

Transactions involving a specific account (any role).

### By Signer

{% code title="Pattern" %}
```
txs.signer.{pubkey}.{slot}
```
{% endcode %}

Transactions signed by a specific account.

### Examples

{% code title="Examples" %}
```
txs.sig.5KtP...abc.234567890
txs.slot.234567890
txs.program.TokenkegQfeZyiNwAJbNbGKPFXCWuBvf9Ss623VQ5DA.234567890
txs.account.So11111111111111111111111111111111111111112.234567890
txs.signer.9WzD...xyz.234567890
```
{% endcode %}

### Subscription Patterns

| Pattern                      | Description                         |
| ---------------------------- | ----------------------------------- |
| `txs.slot.>`                 | All transactions                    |
| `txs.program.TokenkegQf...>` | Token program transactions          |
| `txs.program.675kPX9MHT...>` | Raydium AMM transactions            |
| `txs.account.So111...>`      | Transactions involving wrapped SOL  |
| `txs.signer.9WzD...>`        | Transactions from a specific wallet |

***

## Account Topics

Account state updates when account data changes.

### By Pubkey

{% code title="Pattern" %}
```
accounts.pubkey.{pubkey}.{slot}
```
{% endcode %}

Updates to a specific account.

### By Owner

{% code title="Pattern" %}
```
accounts.owner.{owner_program}.{slot}
```
{% endcode %}

Updates to accounts owned by a specific program.

### Examples

{% code title="Examples" %}
```
accounts.pubkey.So11111111111111111111111111111111111111112.234567890
accounts.owner.TokenkegQfeZyiNwAJbNbGKPFXCWuBvf9Ss623VQ5DA.234567890
```
{% endcode %}

### Subscription Patterns

| Pattern                                             | Description              |
| --------------------------------------------------- | ------------------------ |
| `accounts.>`                                        | All account updates      |
| `accounts.pubkey.So111...>`                         | Specific account updates |
| `accounts.owner.TokenkegQf...>`                     | All token accounts       |
| `accounts.owner.11111111111111111111111111111111.>` | System program accounts  |

***

## Entry Topics

Ledger entry updates containing transaction hashes.

### Pattern

{% code title="Pattern" %}
```
entries.{slot}.{entry_index}
```
{% endcode %}

### Examples

{% code title="Examples" %}
```
entries.234567890.0
entries.234567890.1
entries.234567890.2
```
{% endcode %}

### Subscription Patterns

| Pattern               | Description           |
| --------------------- | --------------------- |
| `entries.>`           | All entries           |
| `entries.234567890.*` | All entries in a slot |

***

## Block Topics

Complete block data and metadata.

### Full Block

{% code title="Pattern" %}
```
blocks.{slot}
```
{% endcode %}

Complete block with all transactions, accounts, and entries.

### Block Metadata

{% code title="Pattern" %}
```
blocks.{slot}.meta
```
{% endcode %}

Block metadata only (hashes, counts, no transaction data).

### Examples

{% code title="Examples" %}
```
blocks.234567890
blocks.234567890.meta
```
{% endcode %}

### Subscription Patterns

| Pattern         | Description             |
| --------------- | ----------------------- |
| `blocks.>`      | All blocks and metadata |
| `blocks.*.meta` | Block metadata only     |

***

## Special Topics

### Subscribe Request

{% code title="Topic" %}
```
thorpulse.subscribe
```
{% endcode %}

Send a Yellowstone-style `SubscribeRequest` to this topic with a reply inbox.

### Unsubscribe

{% code title="Topic" %}
```
thorpulse.unsubscribe
```
{% endcode %}

Cancel an existing subscription.

***

## Topic Access by Tier

| Tier       | Allowed Topics                  |
| ---------- | ------------------------------- |
| Free       | `slots.>`                       |
| Pro        | `slots.>`, `txs.>`, `entries.>` |
| Enterprise | `>` (all topics)                |

***

## Common Program IDs

For convenience, here are common Solana program IDs:

| Program           | ID                                             |
| ----------------- | ---------------------------------------------- |
| System Program    | `11111111111111111111111111111111`             |
| Token Program     | `TokenkegQfeZyiNwAJbNbGKPFXCWuBvf9Ss623VQ5DA`  |
| Token-2022        | `TokenzQdBNbLqP5VEhdkAS6EPFLC1PHnBqCXEpPxuEb`  |
| Associated Token  | `ATokenGPvbdGVxr1b2hvZbsiqW5xWH25efTNsLJA8knL` |
| Memo Program      | `MemoSq4gqABAXKb96qnH8TysNcWxMyWCqXgDLGmfcHr`  |
| Raydium AMM       | `675kPX9MHTjS2zt1qfr1NYHuzeLXfQM9H24wFSUt1Mp8` |
| Orca Whirlpool    | `whirLbMiicVdio4qvUfM5KAg6Ct8VwpYzGff3uctyCc`  |
| Jupiter v6        | `JUP6LkbZbjS1jKKwapdHNy74zcZ3tLUZoi5QNyVTaV4`  |
| Metaplex Metadata | `metaqbxxUerdq28cj1RbAWkYQm3ybzjb6a8bt518x1s`  |

***

## Message Format

All messages are serialized using Yellowstone-compatible protobuf format:

{% code title="SubscribeUpdate (protobuf)" %}
```protobuf
message SubscribeUpdate {
  repeated string filters = 1;
  oneof update_oneof {
    SubscribeUpdateAccount account = 2;
    SubscribeUpdateSlot slot = 3;
    SubscribeUpdateTransaction transaction = 4;
    SubscribeUpdateBlock block = 5;
    SubscribeUpdatePing ping = 6;
    SubscribeUpdatePong pong = 7;
    SubscribeUpdateBlockMeta block_meta = 8;
    SubscribeUpdateEntry entry = 9;
  }
  Timestamp created_at = 10;
}
```
{% endcode %}

See [Protobuf Reference](https://github.com/rpcpool/yellowstone-grpc/tree/master/yellowstone-grpc-proto/proto) for complete message definitions.
