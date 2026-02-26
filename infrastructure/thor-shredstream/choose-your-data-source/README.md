# Choose Your Data Source

Choosing the right data source depends on your latency requirements, technical capabilities, and use case. This guide compares the three main options for receiving Solana transaction data.

## Quick Comparison

| Aspect              | Shred Stream        | Geyser gRPC                  | RPC                 |
| ------------------- | ------------------- | ---------------------------- | ------------------- |
| **Latency**         | Fastest             | Fast                         | Standard            |
| **Timing**          | Before confirmation | After slot processing        | After confirmation  |
| **Data format**     | Raw shreds          | Parsed transactions/accounts | Parsed transactions |
| **Protocol**        | UDP                 | TCP/gRPC                     | HTTP/WebSocket      |
| **Delivery**        | Best-effort         | Guaranteed                   | Guaranteed          |
| **Complexity**      | High                | Medium                       | Low                 |
| **Packet loss**     | Possible            | None                         | None                |
| **Historical data** | No                  | Limited                      | Yes                 |
| **Setup effort**    | Significant         | Moderate                     | Minimal             |

## Latency Breakdown

{% stepper %}
{% step %}
**SHRED STREAM (\~0ms)**

Raw shreds available immediately when produced by the block leader.
{% endstep %}

{% step %}
**GEYSER gRPC (\~100-200ms)**

Slot processed, transactions parsed.
{% endstep %}

{% step %}
**RPC (\~400-800ms)**

Block confirmed, available via API.
{% endstep %}
{% endstepper %}

## Decision Matrix

| Your requirement          | Best choice            |
| ------------------------- | ---------------------- |
| Absolute lowest latency   | ShredStream            |
| Latency-sensitive trading | Shred Stream or Geyser |
| Real-time parsed data     | Geyser gRPC            |
| Simple integration        | RPC                    |
| Guaranteed delivery       | Geyser or RPC          |
| Historical data           | RPC                    |
| Account state streaming   | Geyser gRPC            |
| MEV/HFT strategies        | Shred Stream           |
| Building an indexer       | Geyser gRPC            |
| Wallet/explorer           | RPC                    |

## Technical Requirements by Option

### ShredStream

* Public IP with open UDP port
* Low-latency server (Frankfurt, NYC, Tokyo recommended)
* 50-100 Mbps bandwidth
* Custom deshredding implementation
* FEC decoding (optional, for packet loss recovery)

### Geyser gRPC

* gRPC client library
* Stable TCP connection
* Protobuf parsing
* Subscription management logic

### RPC

* HTTP client
* JSON parsing
* Basic error handling

## Cost Considerations

| Option      | Infrastructure          | Development           | Operational                |
| ----------- | ----------------------- | --------------------- | -------------------------- |
| ShredStream | High (dedicated server) | High (custom parsing) | Medium                     |
| Geyser gRPC | Medium                  | Medium                | Medium                     |
| RPC         | Low                     | Low                   | Low (may have rate limits) |

{% hint style="info" %}
Summary:

* ShredStream is for teams who need every millisecond of advantage and have the technical capability to handle raw shreds. It's the fastest but most complex option.
* Geyser gRPC is the sweet spot for most real-time applications. You get low latency with parsed data and reliable delivery.
* RPC is the standard choice for applications where latency isn't critical. It's simple, reliable, and widely supported.

Choose based on your latency requirements and technical capabilities. When in doubt, start with Geyser or RPC and move to ShredStream only if you need the extra edge.
{% endhint %}
