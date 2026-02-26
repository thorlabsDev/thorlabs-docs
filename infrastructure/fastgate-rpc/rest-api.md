# REST API

In addition to JSON-RPC, a REST endpoint is available for `getProgramAccounts`.

## GET /getProgramAccounts/{programId}

### Query Parameters

| Parameter      | Type    | Description                                          |
| -------------- | ------- | ---------------------------------------------------- |
| `encoding`     | string  | `"base64"` (default), `"base58"`, or `"base64+zstd"` |
| `dataSize`     | integer | Filter by account data size in bytes                 |
| `limit`        | integer | Max results per page (1–10,000)                      |
| `offset`       | integer | Skip N results (for offset-based pagination)         |
| `after`        | string  | Cursor pubkey (for cursor-based pagination)          |
| `since_slot`   | integer | Only return accounts updated after this slot         |
| `slice_offset` | integer | Data slice start offset                              |
| `slice_length` | integer | Data slice byte length                               |

### Response

```json
{
  "result": [
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
  "count": 100,
  "cached": true,
  "next": "LastPubkeyInPage..."
}
```

| Field    | Type           | Description                              |
| -------- | -------------- | ---------------------------------------- |
| `result` | array          | Account objects                          |
| `count`  | integer        | Number of results in this response       |
| `cached` | boolean        | Always `true` when served from cache     |
| `next`   | string or null | Cursor for next page. `null` = last page |

### Example

```bash
# Get first 100 SPL token accounts (dataSize=165)
curl "https://rpc.thornode.io/getProgramAccounts/TokenkegQfeZyiNwAJbNbGKPFXCWuBvf9Ss623VQ5DA?dataSize=165&limit=100&encoding=base64"

# Get next page using cursor
curl "https://rpc.thornode.io/getProgramAccounts/TokenkegQfeZyiNwAJbNbGKPFXCWuBvf9Ss623VQ5DA?dataSize=165&limit=100&after=LastPubkey..."
```

## GET /health

Returns service health status.

### Response

```json
{
  "programs": [
    {
      "program_id": "...",
      "name": "...",
      "snapshot_done": true,
      "snapshot_slot": 280000000,
      "last_grpc_slot": 280001234
    }
  ],
  "grpc_tracking": ["program1...", "program2..."],
  "total_accounts_estimate": 1000000000
}
```
