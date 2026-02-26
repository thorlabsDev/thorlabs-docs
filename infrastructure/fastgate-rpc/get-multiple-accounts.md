# getMultipleAccounts

Returns account information for a list of public keys. Missing accounts are returned as `null`.

## Request

```json
{
  "jsonrpc": "2.0",
  "id": 1,
  "method": "getMultipleAccounts",
  "params": [
    ["Pubkey1...", "Pubkey2...", "Pubkey3..."],
    {
      "encoding": "base64",
      "dataSlice": { "offset": 0, "length": 128 }
    }
  ]
}
```

## Parameters

| Parameter   | Type      | Required | Description                                          |
| ----------- | --------- | -------- | ---------------------------------------------------- |
| pubkeys     | string\[] | Yes      | Array of base58-encoded public keys                  |
| `encoding`  | string    | No       | `"base64"` (default), `"base58"`, or `"base64+zstd"` |
| `dataSlice` | object    | No       | `{ offset, length }` — limit returned data bytes     |

## Response

```json
{
  "jsonrpc": "2.0",
  "id": 1,
  "result": {
    "context": { "slot": 123456789 },
    "value": [
      {
        "data": ["base64-data...", "base64"],
        "executable": false,
        "lamports": 2039280,
        "owner": "TokenkegQfeZyiNwAJbNbGKPFXCWuBvf9Ss623VQ5DA",
        "rentEpoch": 361,
        "space": 165
      },
      null,
      {
        "data": ["base64-data...", "base64"],
        "executable": false,
        "lamports": 5000000,
        "owner": "11111111111111111111111111111111",
        "rentEpoch": 361,
        "space": 0
      }
    ]
  }
}
```

Accounts are returned in the same order as the input array. If an account does not exist, `null` is returned at that position.

## Example

```bash
curl -X POST https://rpc.thornode.io/ \
  -H "Content-Type: application/json" \
  -d '{
    "jsonrpc": "2.0",
    "id": 1,
    "method": "getMultipleAccounts",
    "params": [
      [
        "So11111111111111111111111111111111111111112",
        "EPjFWdd5AufqSSqeM2qN1xzybapC8G4wEGGkZwyTDt1v"
      ],
      { "encoding": "base64" }
    ]
  }'
```
