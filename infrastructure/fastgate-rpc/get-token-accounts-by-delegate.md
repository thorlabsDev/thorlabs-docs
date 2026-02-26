# getTokenAccountsByDelegate

Returns all SPL Token accounts where the specified wallet is set as the delegate. Searches both the Token Program and Token-2022 Program.

## Request

```json
{
  "jsonrpc": "2.0",
  "id": 1,
  "method": "getTokenAccountsByDelegate",
  "params": [
    "<delegatePubkey>",
    { "mint": "<mintPubkey>" },
    { "encoding": "base64" }
  ]
}
```

## Parameters

| Parameter      | Type   | Required | Description                                            |
| -------------- | ------ | -------- | ------------------------------------------------------ |
| delegatePubkey | string | Yes      | Base58-encoded delegate wallet public key              |
| filter         | object | Yes      | One of `{ "mint": "..." }` or `{ "programId": "..." }` |
| `encoding`     | string | No       | `"base64"` (default), `"base58"`, or `"base64+zstd"`   |
| `dataSlice`    | object | No       | `{ offset, length }`                                   |

### Filter Options

**By Mint:**

```json
{ "mint": "EPjFWdd5AufqSSqeM2qN1xzybapC8G4wEGGkZwyTDt1v" }
```

**By Program:**

```json
{ "programId": "TokenkegQfeZyiNwAJbNbGKPFXCWuBvf9Ss623VQ5DA" }
```

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
