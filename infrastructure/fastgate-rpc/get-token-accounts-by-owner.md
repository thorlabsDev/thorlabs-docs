# getTokenAccountsByOwner

Returns all SPL Token accounts owned by a wallet. Searches both the Token Program and Token-2022 Program.

## Request

```json
{
  "jsonrpc": "2.0",
  "id": 1,
  "method": "getTokenAccountsByOwner",
  "params": [
    "<walletPubkey>",
    { "mint": "<mintPubkey>" },
    { "encoding": "base64" }
  ]
}
```

## Parameters

| Parameter    | Type   | Required | Description                                            |
| ------------ | ------ | -------- | ------------------------------------------------------ |
| walletPubkey | string | Yes      | Base58-encoded wallet public key                       |
| filter       | object | Yes      | One of `{ "mint": "..." }` or `{ "programId": "..." }` |
| `encoding`   | string | No       | `"base64"` (default), `"base58"`, or `"base64+zstd"`   |
| `dataSlice`  | object | No       | `{ offset, length }`                                   |

### Filter Options

**By Mint** — returns only token accounts for a specific mint:

```json
{ "mint": "EPjFWdd5AufqSSqeM2qN1xzybapC8G4wEGGkZwyTDt1v" }
```

**By Program** — returns token accounts for a specific token program:

```json
{ "programId": "TokenkegQfeZyiNwAJbNbGKPFXCWuBvf9Ss623VQ5DA" }
```

When using `mint` filter, both Token Program and Token-2022 are searched automatically.

## Response

```json
{
  "jsonrpc": "2.0",
  "id": 1,
  "result": {
    "context": { "slot": 123456789 },
    "value": [
      {
        "pubkey": "TokenAccountPubkey...",
        "account": {
          "data": ["base64-data...", "base64"],
          "executable": false,
          "lamports": 2039280,
          "owner": "TokenkegQfeZyiNwAJbNbGKPFXCWuBvf9Ss623VQ5DA",
          "rentEpoch": 361,
          "space": 165
        }
      }
    ]
  }
}
```

## Example

```bash
curl -X POST https://rpc.thornode.io/ \
  -H "Content-Type: application/json" \
  -d '{
    "jsonrpc": "2.0",
    "id": 1,
    "method": "getTokenAccountsByOwner",
    "params": [
      "YourWalletPubkey...",
      { "mint": "EPjFWdd5AufqSSqeM2qN1xzybapC8G4wEGGkZwyTDt1v" },
      { "encoding": "base64" }
    ]
  }'
```
