# Services

ThorStreamer provides two gRPC services for streaming Solana blockchain data.

{% hint style="info" %}
Recommended for most use cases: use the EventPublisher service for individual streams with lower throughput requirements. Use ThorStreamer service only if you need a high-throughput unified stream and can meet the infrastructure requirements.
{% endhint %}

## EventPublisher Service

Provides individual streams with lower throughput requirements.

### SubscribeToTransactions

Stream real-time transactions matching configured program filters.

{% code title="protobuf" %}
```protobuf
rpc SubscribeToTransactions(Empty) returns (stream StreamResponse)
```
{% endcode %}

Input: None\
Output: Stream of transactions from [supported programs](broken-reference)

Use cases:

* Monitor DeFi protocol interactions
* Track trading activity
* Market making strategies

***

### SubscribeToAccountUpdates

Stream account state changes with flexible filtering.

{% code title="protobuf" %}
```protobuf
rpc SubscribeToAccountUpdates(SubscribeAccountsRequest) returns (stream StreamResponse)
```
{% endcode %}

Input:

{% code title="protobuf" %}
```protobuf
message SubscribeAccountsRequest {
  repeated string account_address = 1;  // Specific accounts (max 100)
  repeated string owner_address = 2;    // Filter by owner program
}
```
{% endcode %}

Filtering options:

* Monitor specific accounts by address
* Monitor all accounts owned by specific programs
* Combine both filters

Use cases:

* Token balance tracking
* Program state monitoring
* Portfolio analytics

***

### SubscribeToSlotStatus

Monitor Solana slot progression and confirmations.

{% code title="protobuf" %}
```protobuf
rpc SubscribeToSlotStatus(Empty) returns (stream StreamResponse)
```
{% endcode %}

Input: None\
Output: Stream of slot status events

Use cases:

* Transaction confirmation tracking
* Block finality monitoring
* Network health checks

***

### SubscribeToWalletTransactions

Stream transactions involving specific wallet addresses.

{% code title="protobuf" %}
```protobuf
rpc SubscribeToWalletTransactions(SubscribeWalletRequest) returns (stream StreamResponse)
```
{% endcode %}

Input:

{% code title="protobuf" %}
```protobuf
message SubscribeWalletRequest {
  repeated string wallet_address = 1;  // Base58 addresses (max 10)
}
```
{% endcode %}

Use cases:

* Wallet activity monitoring
* User transaction tracking
* Portfolio analytics

***

## ThorStreamer Service

High-throughput unified stream combining all event types. This service requires robust infrastructure.

### StreamUpdates

Single stream delivering all events through `MessageWrapper`.

{% code title="protobuf" %}
```protobuf
rpc StreamUpdates(Empty) returns (stream MessageWrapper)
```
{% endcode %}

Output: Stream containing one of:

* `TransactionEventWrapper` — Transaction data with stream type
* `SubscribeUpdateAccountInfo` — Account state changes
* `SlotStatusEvent` — Slot progression

{% hint style="warning" %}
Requirements:

* 8+ CPU cores
* 16GB+ RAM
* Low-latency network
* Worker pools for parallel processing

Clients that cannot keep up will be automatically disconnected.
{% endhint %}
