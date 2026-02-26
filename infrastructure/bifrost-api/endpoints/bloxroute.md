# Bloxroute

Submit transactions through Bloxroute's MEV infrastructure.

## Send Transaction

Submit a single transaction.

Endpoint

```
POST /bloxroute
```

Request Body

```json
{
  "jsonrpc": "2.0",
  "id": 1,
  "method": "sendTransaction",
  "params": ["<base64-transaction>"]
}
```

## Batch Submission

Submit multiple transactions in a single request.

Endpoint

```
POST /blxrt-submit-batch
```

Request Body

```json
{
  "transactions": [
    "<base64-transaction-1>",
    "<base64-transaction-2>"
  ]
}
```

## Paladin Submission

Submit with MEV protection enabled.

Endpoint

```
POST /blxrt-submit-paladin
```

Request Body

```json
{
  "transaction": "<base64-transaction>"
}
```

## Snipe Submission

Submit a snipe transaction.

Endpoint

```
POST /blxrt-submit-snipe
```

Request Body

```json
{
  "transaction": "<base64-transaction>"
}
```

#### Resources

* [Bloxroute Docs](https://docs.bloxroute.com/) - Docs provided by Bloxroute. Must read for minimum fee requirements.
