# Geyser gRPC (ThorStreamer, Yellowstone)

### What it is

Streaming API that delivers parsed transactions and account updates via gRPC after slots are processed by a validator.

### Latency

\~100-200ms — Data is available after the validator processes the slot but before network-wide confirmation.

### Data format

Structured protobuf messages containing:

* Parsed transactions with instructions
* Account updates with before/after states
* Slot notifications
* Block metadata

### Pros

* Parsed, ready-to-use data
* Reliable TCP delivery (no packet loss)
* Filter by program, account, or transaction type
* Easier to integrate than shreds

### Cons

* Slower than ShredStream
* Requires gRPC client implementation
* Limited historical replay
* Still requires dedicated infrastructure

### Best for

* Trading bots
* Real-time indexers
* DeFi applications
* Account monitoring

### Example use case

A trading bot subscribes to a specific DEX program, receives parsed swap instructions, and updates internal price feeds in real-time.
