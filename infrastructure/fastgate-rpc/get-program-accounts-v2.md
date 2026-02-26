# getProgramAccountsV2

Paginated version of `getProgramAccounts` with cursor-based navigation and total count.

> **Note:** Large V1 `getProgramAccounts` queries are automatically rejected and redirected here. If you received a `-32600` error from V1, switch to this method with `limit` and `paginationKey` parameters.

## Request

```json
{
  "jsonrpc": "2.0",
  "id": 1,
  "method": "getProgramAccountsV2",
  "params": [
    "<programId>",
    {
      "encoding": "base64",
      "filters": [],
      "limit": 200,
      "paginationKey": null,
      "changedSinceSlot": null
    }
  ]
}
```

## Parameters

| Parameter          | Type    | Required | Description                                          |
| ------------------ | ------- | -------- | ---------------------------------------------------- |
| `programId`        | string  | Yes      | Base58-encoded program public key                    |
| `encoding`         | string  | No       | `"base64"` (default), `"base58"`, or `"base64+zstd"` |
| `filters`          | array   | No       | Same as `getProgramAccounts` (`dataSize`, `memcmp`)  |
| `dataSlice`        | object  | No       | `{ offset, length }` — limit returned data bytes     |
| `limit`            | integer | No       | Page size, 1–10,000 (default 1,000)                  |
| `paginationKey`    | string  | No       | Cursor from previous response to fetch the next page |
| `changedSinceSlot` | integer | No       | Only return accounts updated after this slot         |

## Response

```json
{
  "jsonrpc": "2.0",
  "id": 1,
  "result": {
    "accounts": [
      {
        "pubkey": "AccountPubkey...",
        "account": {
          "data": ["base64-data...", "base64"],
          "executable": false,
          "lamports": 2039280,
          "owner": "ProgramPubkey...",
          "rentEpoch": 361,
          "space": 165
        }
      }
    ],
    "paginationKey": "LastPubkeyInPage...",
    "totalResults": 1423567
  }
}
```

| Field           | Type           | Description                                              |
| --------------- | -------------- | -------------------------------------------------------- |
| `accounts`      | array          | Account objects for this page                            |
| `paginationKey` | string or null | Cursor for next page. `null` means this is the last page |
| `totalResults`  | integer        | Total number of matching accounts                        |

## Pagination Example

**Page 1:**

```json
{
  "method": "getProgramAccountsV2",
  "params": ["TokenkegQfeZyiNwAJbNbGKPFXCWuBvf9Ss623VQ5DA", { "limit": 200 }]
}
```

**Page 2 (using paginationKey from page 1):**

```json
{
  "method": "getProgramAccountsV2",
  "params": [
    "TokenkegQfeZyiNwAJbNbGKPFXCWuBvf9Ss623VQ5DA",
    { "limit": 200, "paginationKey": "LastPubkeyFromPage1..." }
  ]
}
```

## changedSinceSlot

Use `changedSinceSlot` to fetch only accounts that have been updated after a specific slot. This is useful for incremental syncing.

```json
{
  "method": "getProgramAccountsV2",
  "params": [
    "ProgramId...",
    { "changedSinceSlot": 280000000, "limit": 1000 }
  ]
}
```
