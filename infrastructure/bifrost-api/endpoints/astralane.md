---
description: Submit transactions through Astralane's MEV infrastructure.
---

# Astralane

Submit transactions through Astralane's MEV infrastructure.

## Send Transaction

Submit a single transaction.

Endpoint:

{% code title="POST /astralane" %}
```
```
{% endcode %}

Request Body:

```json
{
  "jsonrpc": "2.0",
  "id": 1,
  "method": "sendTransaction",
  "params": ["<base64-transaction>"]
}
```

***

## Bundle Submission

Submit a bundle of related transactions (max 4).

Endpoint:

{% code title="POST /astrln-submit-bundle" %}
```
```
{% endcode %}

Request Body:

```json
{
  "transactions": [
    "<base64-transaction-1>",
    "<base64-transaction-2>"
  ],
  "encoding": "base64",
  "mevProtect": true,
  "revertProtection": false
}
```

***

## Batch Submission

Submit a batch of up to 25 independent transactions. Unlike bundles, batch transactions are processed individually and return separate signatures for each transaction.

Endpoint:

{% code title="POST /astrln-submit-batch" %}
```
```
{% endcode %}

Request Body (simple format):

```json
{
  "transactions": [
    "<base64-transaction-1>",
    "<base64-transaction-2>",
    "<base64-transaction-3>"
  ],
  "mevProtect": true
}
```

Request Body (RPC format via `/astralane`):

```json
{
  "jsonrpc": "2.0",
  "id": 1,
  "method": "sendBatch",
  "params": [
    [
      "<base64-transaction-1>",
      "<base64-transaction-2>",
      "<base64-transaction-3>"
    ],
    {
      "mevProtect": true
    }
  ]
}
```

Response:

```json
{
  "result": [
    "<signature-1>",
    "<signature-2>",
    "<signature-3>"
  ]
}
```

| Parameter      | Type      | Required | Description                                                                  |
| -------------- | --------- | -------- | ---------------------------------------------------------------------------- |
| transactions   | string\[] | Yes      | Array of base64-encoded serialized transactions. Maximum batch size is 25.   |
| mevProtect     | boolean   | No       | When true, enables MEV protection for all transactions in the batch.         |

***

## Ideal Submission

Submit ideal pair transactions.

Endpoint:

{% code title="POST /astrln-submit-ideal" %}
```
```
{% endcode %}

Request Body:

```json
{
  "transactions": [
    "<base64-transaction-1>",
    "<base64-transaction-2>"
  ]
}
```

***

## Paladin Submission

Submit with MEV protection enabled.

Endpoint:

{% code title="POST /astrln-submit-paladin" %}
```
```
{% endcode %}

Request Body:

```json
{
  "transaction": "<base64-transaction>"
}
```

***

## Get Nonce

Retrieve nonce account information.

Endpoint:

{% code title="GET /astrln-get-nonce" %}
```
```
{% endcode %}

#### Resources

* [Astralane Docs](https://astralane.gitbook.io/docs) - Docs provided by Astralane. Must read for minimum fee requirements.
