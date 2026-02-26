---
description: ThorPulse NATS documentation
---

# ThorPulse NATS

ThorPulse is a high-performance Solana data streaming service that delivers real-time blockchain data with ultra-low latency.

## What is ThorPulse?

ThorPulse consumes Solana shreds from ThorShredStream, processes them through a high-performance pipeline, and delivers parsed data (slots, transactions, accounts, entries, blocks) over an embedded NATS server using Yellowstone-compatible protobuf format.

Key Features:

* Ultra-low latency data delivery (sub-millisecond)
* Yellowstone-compatible protobuf format
* Server-side filtering with SubscribeRequest
* JWT authentication with subscription tiers

## Quick Links

* [Quick Start Guide](thorpulse-nats/getting-started/quickstart) - Get connected in 5 minutes
* [Authentication](thorpulse-nats/getting-started/authentication) - JWT credentials and tier system
* [Subscription Reference](thorpulse-nats/reference/subscriptions) - How to subscribe to data
* [Topic Reference](thorpulse-nats/reference/topics) - Complete topic schema

## SDKs

{% tabs %}
{% tab title="Go" %}
Installation:

{% code title="Install" %}
```bash
go get github.com/thorlabsDev/thorpulse-go
```
{% endcode %}

Example usage:

{% code title="example.go" %}
```go
import "github.com/thorlabsDev/thorpulse-go"

c, err := client.Connect(client.DefaultConfig("nats://ny-rpc.thornode.io:4222"))
defer c.Close()

c.SubscribeSlots(func(slot *client.SlotUpdate) {
    fmt.Printf("Slot %d: %s\n", slot.Slot, slot.Status)
})
```
{% endcode %}

More: [Go SDK Documentation](https://github.com/thorlabsDev/thorpulse-go)
{% endtab %}

{% tab title="Rust" %}
Add to Cargo.toml:

{% code title="Cargo.toml" %}
```toml
[dependencies]
thorpulse-client = "0.1"
```
{% endcode %}

Example usage:

{% code title="example.rs" %}
```rust
use thorpulse_client::ThorPulseClient;

let client = ThorPulseClient::connect_simple("nats://ny-rpc.thornode.io:4222").await?;
let mut slots = client.subscribe_slots().await?;

while let Some(slot) = slots.recv().await {
    println!("Slot {}: {:?}", slot?.slot, slot?.status);
}
```
{% endcode %}

More: [Rust SDK Documentation](https://crates.io/crates/thorpulse-client)
{% endtab %}
{% endtabs %}

## Documentation Structure

```
docs/
├── getting-started/
│   ├── quickstart.md          # 5-minute quick start
│   └── authentication.md      # JWT credentials and tiers
├── reference/
│   ├── topics.md              # Complete topic schema
│   └── subscriptions.md       # Subscription patterns and filters
```

## Data Types

ThorPulse streams the following Solana data types:

| Type         | Description           | Topic Pattern                 |
| ------------ | --------------------- | ----------------------------- |
| Slots        | Slot status updates   | `slots.{slot}.{status}`       |
| Transactions | Parsed transactions   | `txs.program.{id}.{slot}`     |
| Accounts     | Account state changes | `accounts.pubkey.{pk}.{slot}` |
| Entries      | Ledger entries        | `entries.{slot}.{index}`      |
| Blocks       | Complete blocks       | `blocks.{slot}`               |

## Getting Help

* Contact Thor Labs for support
* See SDK documentation for working code examples

## License

ThorPulse is licensed under the MIT License.
