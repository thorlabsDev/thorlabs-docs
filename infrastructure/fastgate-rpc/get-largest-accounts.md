# getLargestAccounts

Returns the 20 largest accounts by lamport balance across the entire ledger.

## Request

```json
{
  "jsonrpc": "2.0",
  "id": 1,
  "method": "getLargestAccounts",
  "params": []
}
```

## Parameters

None.

## Response

```json
{
  "jsonrpc": "2.0",
  "id": 1,
  "result": {
    "context": { "slot": 123456789 },
    "value": [
      {
        "address": "LargestAccountPubkey...",
        "lamports": 99999999999999
      },
      {
        "address": "SecondLargestPubkey...",
        "lamports": 88888888888888
      }
    ]
  }
}
```

## Response Fields

| Field      | Type    | Description                 |
| ---------- | ------- | --------------------------- |
| `address`  | string  | Account public key          |
| `lamports` | integer | Account balance in lamports |
