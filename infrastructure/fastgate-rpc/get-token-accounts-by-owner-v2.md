# getTokenAccountsByOwnerV2

Paginated version of `getTokenAccountsByOwner` with cursor-based navigation and total count.

> **Note:** Large V1 `getTokenAccountsByOwner` queries are automatically rejected and redirected here. If you received a `-32600` error from V1, switch to this method with `limit` and `paginationKey` parameters.

## Request

```json
{
  "jsonrpc": "2.0",
  "id": 1,
  "method": "getTokenAccountsByOwnerV2",
  "params": [
    "<walletPubkey>",
    { "programId": "TokenkegQfeZyiNwAJbNbGKPFXCWuBvf9Ss623VQ5DA" },
    {
      "encoding": "base64",
      "limit": 200,
      "paginationKey": null
    }
  ]
}
```

## Parameters

| Parameter          | Type    | Required | Description                                            |
| ------------------ | ------- | -------- | ------------------------------------------------------ |
| `walletPubkey`     | string  | Yes      | Base58-encoded wallet public key                       |
| filter             | object  | Yes      | One of `{ "mint": "..." }` or `{ "programId": "..." }` |
| `encoding`         | string  | No       | `"base64"` (default), `"base58"`, or `"base64+zstd"`   |
| `dataSlice`        | object  | No       | `{ offset, length }` — limit returned data bytes       |
| `limit`            | integer | No       | Page size, 1–10,000 (default 1,000)                    |
| `paginationKey`    | string  | No       | Cursor from previous response to fetch the next page   |
| `changedSinceSlot` | integer | No       | Only return accounts updated after this slot           |

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
    ],
    "paginationKey": "LastPubkeyInPage...",
    "totalResults": 4523
  }
}
```

| Field           | Type           | Description                                              |
| --------------- | -------------- | -------------------------------------------------------- |
| `value`         | array          | Token account objects for this page                      |
| `paginationKey` | string or null | Cursor for next page. `null` means this is the last page |
| `totalResults`  | integer        | Total number of matching token accounts                  |

## Pagination Example

**Page 1:**

```json
{
  "method": "getTokenAccountsByOwnerV2",
  "params": [
    "YourWalletPubkey...",
    { "programId": "TokenkegQfeZyiNwAJbNbGKPFXCWuBvf9Ss623VQ5DA" },
    { "encoding": "base64", "limit": 200 }
  ]
}
```

**Page 2 (using paginationKey from page 1):**

```json
{
  "method": "getTokenAccountsByOwnerV2",
  "params": [
    "YourWalletPubkey...",
    { "programId": "TokenkegQfeZyiNwAJbNbGKPFXCWuBvf9Ss623VQ5DA" },
    { "encoding": "base64", "limit": 200, "paginationKey": "LastPubkeyFromPage1..." }
  ]
}
```

## Example

```bash
curl -X POST https://rpc.thornode.io/ \
  -H "Content-Type: application/json" \
  -d '{
    "jsonrpc": "2.0",
    "id": 1,
    "method": "getTokenAccountsByOwnerV2",
    "params": [
      "YourWalletPubkey...",
      { "programId": "TokenkegQfeZyiNwAJbNbGKPFXCWuBvf9Ss623VQ5DA" },
      { "encoding": "base64", "limit": 100 }
    ]
  }'
```
