# Introduction

FastGate RPC is a dedicated Solana RPC endpoint purpose-built for high-speed account queries. It delivers consistently low latency across all `getProgramAccounts` variants and token account methods — with full Solana RPC compatibility.

## Why FastGate

* **Sub-200ms response times** on paginated queries across all methods
* **100% uptime** on all 9 supported methods — no blocked or unsupported calls
* **Full Solana RPC compatibility** — drop-in replacement for account query methods
* **Pagination support** — cursor-based pagination with `getProgramAccountsV2`
* **Incremental sync** — `changedSinceSlot` parameter for delta updates
* **Multiple encodings** — `base64`, `base58`, and `base64+zstd` for compressed payloads

## Performance

All benchmarks measured against Helius RPC under identical conditions (same methods, same parameters, same network path).

### Low-Stress Benchmark (10 req/method, 9 methods)

| Metric                | FastGate     | Helius      |
| --------------------- | ------------ | ----------- |
| **Success Rate**      | 90/90 (100%) | 70/90 (78%) |
| **p50 Latency**       | 179 ms       | 413 ms      |
| **p95 Latency**       | 951 ms       | 1,631 ms    |
| **Timeouts**          | 0            | 10          |
| **Methods Supported** | 9/9          | 7/9         |

### Per-Method Latency (p50)

| Method                             | FastGate | Helius   | Speedup  |
| ---------------------------------- | -------- | -------- | -------- |
| getProgramAccountsV2 (unfiltered)  | 179 ms   | 419 ms   | **2.3x** |
| getProgramAccountsV2 (filtered)    | 207 ms   | 420 ms   | **2.0x** |
| getProgramAccounts V1 (unfiltered) | 928 ms   | 1,574 ms | **1.7x** |
| getProgramAccounts V1 (filtered)   | 932 ms   | 1,541 ms | **1.7x** |
| getMultipleAccounts                | 175 ms   | 252 ms   | **1.4x** |
| getTokenAccountsByOwner            | 181 ms   | 252 ms   | **1.4x** |
| getTokenLargestAccounts            | 175 ms   | 263 ms   | **1.5x** |
| getTokenAccountsByDelegate         | 176 ms   | timeout  | n/a      |
| getLargestAccounts                 | 176 ms   | blocked  | n/a      |

### High-Load Benchmark (50 RPS sustained, 30 seconds)

| Metric          | FastGate      | Helius        |
| --------------- | ------------- | ------------- |
| **Completed**   | 1,501 / 1,501 | 1,500 / 1,500 |
| **Errors**      | 0 (0%)        | 596 (40%)     |
| **p50 Latency** | 262 ms        | 5,000 ms      |
| **p95 Latency** | 459 ms        | 7,521 ms      |
| **p99 Latency** | 538 ms        | 9,445 ms      |

Under sustained load, FastGate maintains sub-second latencies. Helius applies stricter rate limits at this volume, which results in higher timeout rates — expected behavior for a shared public RPC tier.

## Quick Start

Send a JSON-RPC request to the endpoint:

```bash
curl -X POST https://rpc.thornode.io/ \
  -H "Content-Type: application/json" \
  -d '{
    "jsonrpc": "2.0",
    "id": 1,
    "method": "getProgramAccountsV2",
    "params": [
      "TokenkegQfeZyiNwAJbNbGKPFXCWuBvf9Ss623VQ5DA",
      {
        "encoding": "base64",
        "filters": [{ "dataSize": 165 }],
        "limit": 200
      }
    ]
  }'
```

See the individual method pages for detailed parameter documentation and response formats.
