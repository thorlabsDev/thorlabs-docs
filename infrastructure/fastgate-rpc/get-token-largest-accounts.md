# getTokenLargestAccounts

Returns the 20 largest token holders for a given mint address.

## Request

```json
{
  "jsonrpc": "2.0",
  "id": 1,
  "method": "getTokenLargestAccounts",
  "params": ["<mintPubkey>"]
}
```

## Parameters

| Parameter  | Type   | Required | Description                    |
| ---------- | ------ | -------- | ------------------------------ |
| mintPubkey | string | Yes      | Base58-encoded mint public key |

## Response

```json
{
  "jsonrpc": "2.0",
  "id": 1,
  "result": {
    "context": { "slot": 123456789 },
    "value": [
      {
        "address": "LargestHolderPubkey...",
        "amount": "1000000000",
        "decimals": 6,
        "uiAmount": 1000.0,
        "uiAmountString": "1000"
      },
      {
        "address": "SecondLargestPubkey...",
        "amount": "500000000",
        "decimals": 6,
        "uiAmount": 500.0,
        "uiAmountString": "500"
      }
    ]
  }
}
```

## Response Fields

| Field            | Type    | Description                     |
| ---------------- | ------- | ------------------------------- |
| `address`        | string  | Token account public key        |
| `amount`         | string  | Raw token amount (as string)    |
| `decimals`       | integer | Token decimals from the mint    |
| `uiAmount`       | number  | Human-readable amount           |
| `uiAmountString` | string  | Human-readable amount as string |

## Example

```bash
curl -X POST https://rpc.thornode.io/ \
  -H "Content-Type: application/json" \
  -d '{
    "jsonrpc": "2.0",
    "id": 1,
    "method": "getTokenLargestAccounts",
    "params": ["EPjFWdd5AufqSSqeM2qN1xzybapC8G4wEGGkZwyTDt1v"]
  }'
```
