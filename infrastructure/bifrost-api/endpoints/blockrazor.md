# Blockrazor

Submit transactions through BlockRazor's global infrastructure.

***

## Send Transaction

Submit a single transaction.

**Endpoint**

```
POST /blockrazor
```

**Request Body**

```json
{
  "jsonrpc": "2.0",
  "id": 1,
  "method": "sendTransaction",
  "params": ["<base64-transaction>"]
}
```

#### Resources

* [BlockRazor Docs](https://blockrazor.gitbook.io/blockrazor) - Docs provided by BlockRazor. Must read for minimum fee requirements.
