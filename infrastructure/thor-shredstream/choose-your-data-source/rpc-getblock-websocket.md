# RPC (getBlock, WebSocket)

### What it is

Standard Solana JSON-RPC API for querying confirmed blocks and subscribing to updates via WebSocket.

### Latency

\~400-800ms+ — Data is available after block confirmation and propagation across the network.

### Data format

JSON responses containing:

* Fully confirmed blocks
* Parsed transactions
* Account states
* Network status

### Pros

* Simple HTTP/WebSocket integration
* Guaranteed data consistency
* Historical data access
* Wide library support
* No special infrastructure needed

### Cons

* Highest latency of the three options
* Not suitable for latency-sensitive strategies
* Rate limits may apply

### Best for

* General applications
* Wallets and explorers
* Analytics and reporting
* Applications where correctness matters more than speed

### Example use case

A portfolio tracker queries confirmed transactions to display user balances and transaction history.
