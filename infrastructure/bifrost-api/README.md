# Bifrost API

High-performance Solana transaction proxy connecting you to leading MEV infrastructure providers through a single, unified API.

## Why Bifrost?

* **One API, Multiple Providers** - Access Bloxroute, Astralane, and BlockRazor through unified endpoints
* **MEV Protection** - Built-in support for Paladin submissions across providers
* **Advanced Strategies** - Bundle, batch, and snipe capabilities for sophisticated trading

## Supported Providers

### Bloxroute

Industry-leading MEV infrastructure with batch processing, Paladin protection, and snipe capabilities.

### Astralane

Advanced bundle and ideal pair submissions with MEV protection.

### BlockRazor

Fast, reliable transaction submission with global coverage.

## Quick Example

{% code title="curl" %}
```bash
curl -X POST https://your-bifrost-endpoint/bloxroute \
  -H "Content-Type: application/json" \
  -d '{
    "jsonrpc": "2.0",
    "id": 1,
    "method": "sendTransaction",
    "params": ["your-base64-transaction"]
  }'
```
{% endcode %}

## Next Steps

* [View all endpoints](bifrost-api/endpoints)
* [Bloxroute API](bifrost-api/endpoints/bloxroute)
* [Astralane API](bifrost-api/endpoints/astralane)
* [BlockRazor API](bifrost-api/endpoints/blockrazor)
