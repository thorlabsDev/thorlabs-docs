# Thor ShredStream

> Raw Solana shreds streamed via UDP - the fastest on-chain signal available

## What is Thor ShredStream?

Thor ShredStream provides **raw Solana shreds via UDP**, giving you the earliest possible access to transaction data. Shreds arrive before blocks are confirmed, enabling sub-second reaction times for trading strategies.

### Key Benefits

| Feature             | Description                                                       |
| ------------------- | ----------------------------------------------------------------- |
| **Earliest Signal** | Receive shreds as they're produced, before block confirmation     |
| **Raw Data**        | Unprocessed shreds for custom parsing and strategy implementation |
| **Low Latency**     | Direct UDP delivery minimizes network overhead                    |
| **Reliable Source** | Enterprise-grade shred infrastructure                             |

## What Are Shreds?

Solana breaks transactions into small packets called **shreds** for fast network propagation. Each shred is \~1228 bytes containing:

* Slot number
* Shred index
* Shred type (data or coding/FEC)
* Transaction data fragment

Validators reassemble shreds into complete blocks. By receiving shreds directly, you see transaction data before the block is finalized.

## Use Cases

* **High-Frequency Trading (HFT)** - React to transactions before block confirmation
* **Arbitrage** - Detect price movements across DEXs at the earliest moment
* **MEV Strategies** - Build and submit transactions with minimal delay
* **Market Making** - Update quotes based on incoming order flow
* **Analytics** - Real-time network monitoring and statistics
