# Shred Stream

### What it is

Raw Solana shreds delivered via UDP as they're produced by the block leader. Shreds are the smallest unit of data in Solana's Turbine protocol.

### Latency

\~0ms from production — You receive shreds at the same time validators do, before any processing or confirmation.

### Data format

Raw binary shreds (1228 bytes max) containing:

* Slot number
* Shred index
* Shred type (data/coding)
* Transaction data fragments

### Pros

* Absolute lowest latency available
* See transactions before anyone using Geyser or RPC
* Direct network-level access

### Cons

* Requires custom deshredding logic
* UDP may lose packets (no retransmission)
* High technical complexity
* No historical replay
* Requires public IP with open UDP port

### Best for

* High-frequency trading (HFT)
* MEV searchers
* Arbitrage bots
* Latency-critical applications

### Example use case

A MEV bot detects a large swap in shreds, builds a backrun transaction, and submits it before the original transaction is even confirmed.
