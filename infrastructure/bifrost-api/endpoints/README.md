---
description: Overview of all available API endpoints.
---

# Endpoints

Overview of all available API endpoints.

***

## Standard Submissions

Send transactions through your preferred provider.

| Endpoint           | Provider   | Description          |
| ------------------ | ---------- | -------------------- |
| `POST /bloxroute`  | Bloxroute  | Standard transaction |
| `POST /astralane`  | Astralane  | Standard transaction |
| `POST /blockrazor` | BlockRazor | Standard transaction |

***

## Bloxroute Specialized

Advanced submission methods exclusive to Bloxroute.

| Endpoint                     | Description                  |
| ---------------------------- | ---------------------------- |
| `POST /blxrt-submit-batch`   | Submit multiple transactions |
| `POST /blxrt-submit-paladin` | MEV-protected submission     |
| `POST /blxrt-submit-snipe`   | Snipe submission             |

***

## Astralane Specialized

Advanced submission methods exclusive to Astralane.

| Endpoint                      | Description                            |
| ----------------------------- | -------------------------------------- |
| `POST /astrln-submit-bundle`  | Bundle multiple transactions (max 4)   |
| `POST /astrln-submit-batch`   | Batch submit up to 25 transactions     |
| `POST /astrln-submit-ideal`   | Ideal pair submission                  |
| `POST /astrln-submit-paladin` | MEV-protected submission               |
| `GET /astrln-get-nonce`       | Retrieve nonce info                    |
