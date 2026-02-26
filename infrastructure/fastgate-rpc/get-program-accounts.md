# getProgramAccounts

Returns all accounts owned by the specified program.

## Request

```json
{
  "jsonrpc": "2.0",
  "id": 1,
  "method": "getProgramAccounts",
  "params": [
    "<programId>",
    {
      "encoding": "base64",
      "filters": [],
      "dataSlice": { "offset": 0, "length": 100 },
      "withContext": false
    }
  ]
}
```

## Parameters

| Parameter     | Type    | Required | Description                                                        |
| ------------- | ------- | -------- | ------------------------------------------------------------------ |
| `programId`   | string  | Yes      | Base58-encoded program public key                                  |
| `encoding`    | string  | No       | `"base64"` (default), `"base58"`, or `"base64+zstd"`               |
| `filters`     | array   | No       | Filter results using `dataSize` or `memcmp`                        |
| `dataSlice`   | object  | No       | Limit returned data to `{ offset, length }`                        |
| `withContext` | bool    | No       | If `true`, wraps result in `{ context: { slot }, value: [...] }`   |
| `limit`       | integer | No       | Max results per page (1–10,000, default 1,000). Enables pagination |
| `after`       | string  | No       | Cursor pubkey for pagination. Returns results after this key       |

## Filters

### dataSize

```json
{ "dataSize": 165 }
```

Only return accounts with the specified data length in bytes.

### memcmp

```json
{
  "memcmp": {
    "offset": 32,
    "bytes": "<base58-encoded-bytes>",
    "encoding": "base58"
  }
}
```

| Field      | Type    | Description                        |
| ---------- | ------- | ---------------------------------- |
| `offset`   | integer | Byte offset into account data      |
| `bytes`    | string  | Encoded bytes to match             |
| `encoding` | string  | `"base58"` (default) or `"base64"` |

## Response (Standard)

```json
{
  "jsonrpc": "2.0",
  "id": 1,
  "result": [
    {
      "pubkey": "AccountPublicKey...",
      "account": {
        "data": ["base64-data...", "base64"],
        "executable": false,
        "lamports": 2039280,
        "owner": "ProgramPublicKey...",
        "rentEpoch": 361,
        "space": 165
      }
    }
  ]
}
```

## Response (with `withContext: true`)

```json
{
  "jsonrpc": "2.0",
  "id": 1,
  "result": {
    "context": { "slot": 123456789 },
    "value": [
      {
        "pubkey": "AccountPublicKey...",
        "account": { ... }
      }
    ]
  }
}
```

## Response (Paginated — when `limit` or `after` is provided)

```json
{
  "jsonrpc": "2.0",
  "id": 1,
  "result": {
    "accounts": [ ... ],
    "paginationKey": "LastAccountPubkey...",
    "totalResults": 54321
  }
}
```

| Field           | Type           | Description                                         |
| --------------- | -------------- | --------------------------------------------------- |
| `accounts`      | array          | Array of account objects                            |
| `paginationKey` | string or null | Pass as `after` in next request. `null` = last page |
| `totalResults`  | integer        | Total matching accounts across all pages            |

## Example

```bash
curl -X POST https://rpc.thornode.io/ \
  -H "Content-Type: application/json" \
  -d '{
    "jsonrpc": "2.0",
    "id": 1,
    "method": "getProgramAccounts",
    "params": [
      "TokenkegQfeZyiNwAJbNbGKPFXCWuBvf9Ss623VQ5DA",
      {
        "encoding": "base64",
        "filters": [
          { "dataSize": 165 },
          { "memcmp": { "offset": 32, "bytes": "YourWalletPubkey..." } }
        ]
      }
    ]
  }'
```

## Large Query Protection

Queries that would return more than **100,000 accounts** (or **10,000** for Token Program / Token-2022) are automatically rejected with a `-32600` error directing you to use [`getProgramAccountsV2`](get-program-accounts-v2) with pagination instead.

This applies to unfiltered or broadly-filtered V1 requests. To avoid this, either:

* Use `getProgramAccountsV2` with `limit` and `paginationKey` for large result sets
* Add `dataSize` or `memcmp` filters to narrow results below the threshold

**Example error response:**

```json
{
  "jsonrpc": "2.0",
  "id": 1,
  "error": {
    "code": -32600,
    "message": "Too many accounts requested (Large number of pubkeys), Please use getProgramAccountsV2 with pagination to handle large datasets."
  }
}
```

## Error Codes

| Code     | Message                     | Description                                         |
| -------- | --------------------------- | --------------------------------------------------- |
| `-32600` | Too many accounts requested | Result set too large for V1. Use V2 with pagination |
| `-32602` | Invalid params              | Missing or malformed parameters                     |
| `-32004` | Program is still indexing   | Data not yet available, retry shortly               |
| `-32603` | Internal error              | Server-side error                                   |
