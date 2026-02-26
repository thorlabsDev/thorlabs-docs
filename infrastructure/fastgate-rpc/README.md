# FastGate RPC

FastGate RPC is a high-performance Solana RPC endpoint optimized for account queries. It provides low-latency responses for `getProgramAccounts` and related methods.

## Supported Methods

| Method                           | Description                           |
| -------------------------------- | ------------------------------------- |
| `getProgramAccounts`             | Get all accounts owned by a program   |
| `getProgramAccountsV2`           | Paginated version with cursor support |
| `getMultipleAccounts`            | Get multiple accounts by pubkey       |
| `getTokenAccountsByOwner`        | Get SPL token accounts for a wallet   |
| `getTokenAccountsByDelegate`     | Get delegated SPL token accounts      |
| `getTokenLargestAccounts`        | Get top 20 token holders for a mint   |
| `getLargestAccounts`             | Get top 20 accounts by lamports       |
| `getBlock` / `getConfirmedBlock` | Proxied to upstream Solana RPC        |

## Endpoint

```
POST https://rpc.thornode.io/
Content-Type: application/json
```

## Authentication

Requests require IP allowlist authentication. See the Authentication section.

## Encoding

| Encoding      | Description                                        |
| ------------- | -------------------------------------------------- |
| `base64`      | Default. Standard base64                           |
| `base58`      | Base58 encoding                                    |
| `base64+zstd` | Zstd-compressed, base64-encoded (smallest payload) |

## REST Endpoint

A REST interface is also available:

```
GET /getProgramAccounts/{programId}?encoding=base64&limit=100&after=<pubkey>
```
