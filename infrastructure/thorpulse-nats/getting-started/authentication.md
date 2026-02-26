# Authentication

ThorPulse uses NATS JWT authentication to secure access and enforce subscription limits based on your tier.

## Subscription Tiers

| Tier  | Subscriptions | Available Topics |
| ----- | ------------- | ---------------- |
| Flash | 100           | all topics       |
| Thor  | 250           | all topics       |
| Prime | Unlimited     | all topics       |

## Getting Credentials

Contact Thor Labs to obtain your credentials. You will receive:

* A `.creds` file containing your JWT and NKey seed
* The NATS server URL (e.g., `nats://ny-rpc.thornode.io:4223`)

## Credentials File Format

A `.creds` file looks like:

```
-----BEGIN NATS USER JWT-----
eyJ0eXAiOiJKV1QiLCJhbGciOiJlZDI1NTE5LW5rZXkifQ.eyJqdGkiOiJBQk...
------END NATS USER JWT------

************************* IMPORTANT *************************
NKEY Seed printed below can be used to sign and prove identity.
NKEYs are sensitive and should be treated as secrets.

-----BEGIN USER NKEY SEED-----
SUAM4QXBNMN3FHPJQ7VUPNKJ3HZ3TJWMHFQ4KJ6UJKA7AB2CD3EF...
------END USER NKEY SEED------

*************************************************************
```

**Keep this file secure!** The NKey seed can be used to authenticate as you.

## Using Credentials

### Go SDK

```go
package main

import (
    "github.com/thorlabsDev/thorpulse-go"
    "log"
)

func main() {
    // Option 1: Load from file
    creds, err := client.LoadCredentials("user.creds")
    if err != nil {
        log.Fatal(err)
    }

    c, err := client.New(
        client.WithURL("nats://ny-rpc.thornode.io:4223"),
        client.WithCredentials(creds),
    )

    // Option 2: Load directly
    c, err := client.New(
        client.WithURL("nats://ny-rpc.thornode.io:4223"),
        client.WithCredentialsFile("user.creds"),
    )

    // Option 3: From environment
    // Set THORPULSE_CREDS_FILE=/path/to/user.creds
    c, err := client.New(
        client.WithURL("nats://ny-rpc.thornode.io:4223"),
        client.WithCredentialsFromEnv(),
    )
}
```

### Rust SDK

```rust
use thorpulse_client::{ThorPulseClient, Credentials, Config};
use std::time::Duration;

#[tokio::main]
async fn main() -> thorpulse_client::Result<()> {
    // Load credentials
    let creds = Credentials::from_file("user.creds")?;

    // Connect with credentials
    let config = Config::builder("nats://ny-rpc.thornode.io:4223")
        .name("my-app")
        .credentials(creds)
        .build();

    let client = ThorPulseClient::connect(config).await?;

    // Use client...
    Ok(())
}
```

## Environment Variables

Configure authentication via environment variables:

| Variable               | Description              |
| ---------------------- | ------------------------ |
| `THORPULSE_CREDS_FILE` | Path to credentials file |
| `THORPULSE_JWT`        | JWT token directly       |
| `THORPULSE_NKEY_SEED`  | NKey seed directly       |

## Troubleshooting

<details>

<summary>"authorization violation"</summary>

Your user doesn't have permission to subscribe to the requested topic. Check:

* Your tier allows the topic type
* You haven't exceeded your subscription limit
* The topic pattern is valid

</details>

<details>

<summary>"signature verification failed"</summary>

The NKey seed doesn't match the JWT. Ensure you're using the correct credentials file.

</details>

<details>

<summary>"timeout waiting for pong"</summary>

The server didn't respond. Check:

* The NATS URL is correct
* Network connectivity to the server
* Firewall rules allow outbound to port 4223

</details>

<details>

<summary>"invalid credentials file"</summary>

The credentials file is malformed. Verify:

* Both JWT and NKEY SEED sections are present
* No extra whitespace or corruption
* File encoding is UTF-8

</details>

## Security Best Practices

{% stepper %}
{% step %}
**Never commit credentials to git**

Add `*.creds` to `.gitignore`.
{% endstep %}

{% step %}
**Use environment variables in production**

Don't hardcode paths; use environment variables instead.
{% endstep %}

{% step %}
**Rotate credentials regularly**

Request new credentials periodically.
{% endstep %}

{% step %}
**Restrict file permissions**

Use `chmod 600 user.creds` to limit file access.
{% endstep %}

{% step %}
**Use separate credentials per environment**

Use different credentials for dev/staging/prod.
{% endstep %}
{% endstepper %}
