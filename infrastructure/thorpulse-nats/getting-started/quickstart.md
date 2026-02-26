# Quickstart

Get connected to ThorPulse and receiving Solana data in 5 minutes.

{% hint style="info" %}
Prerequisites

* Go 1.21 or later
* ThorPulse credentials (JWT + Seed)
{% endhint %}

{% stepper %}
{% step %}
**Get Your Credentials**

Contact Thor Labs to obtain your credentials file (`thorpulse.creds`). This file contains your JWT token and NKey seed for authentication.
{% endstep %}

{% step %}
**Install the SDK**

```bash
go get github.com/thorpulse/thorpulse-go
```
{% endstep %}

{% step %}
**Connect and Subscribe**

Create a file `main.go`:

{% code title="main.go" %}
```go
package main

import (
    "fmt"
    "log"
    "os"
    "os/signal"
    "syscall"

    "github.com/thorlabsDev/thorpulse-go"
)

func main() {
    // Connect using credentials file
    cfg := client.ConfigWithCredsFile(
        "nats://ny-rpc.thornode.io:4223",
        "thorpulse.creds",
    )

    // Add connection callbacks (optional)
    cfg.OnDisconnect = func(err error) {
        log.Printf("Disconnected: %v", err)
    }
    cfg.OnReconnect = func() {
        log.Println("Reconnected!")
    }

    // Connect
    c, err := client.Connect(cfg)
    if err != nil {
        log.Fatal("Connection failed:", err)
    }
    defer c.Close()

    fmt.Println("Connected to ThorPulse!")

    // Subscribe to slot updates
    err = c.SubscribeSlots(func(slot *client.SlotUpdate) {
        fmt.Printf("Slot %d: %s\n", slot.Slot, slot.Status)
    })
    if err != nil {
        log.Fatal("Subscribe failed:", err)
    }

    fmt.Println("Subscribed to slots. Press Ctrl+C to exit.")

    // Wait for interrupt signal
    sig := make(chan os.Signal, 1)
    signal.Notify(sig, syscall.SIGINT, syscall.SIGTERM)
    <-sig

    fmt.Println("Shutting down...")
}
```
{% endcode %}
{% endstep %}

{% step %}
**Run**

```bash
go run main.go
```

Expected output:

```
Connected to ThorPulse!
Subscribed to slots. Press Ctrl+C to exit.
Slot 234567890: first_shred_received
Slot 234567890: completed
Slot 234567890: processed
Slot 234567890: confirmed
Slot 234567891: first_shred_received
...
```
{% endstep %}

{% step %}
**Try Other Subscriptions**

**Subscribe to Transactions**

```go
// All transactions for a program
err = c.SubscribeProgram("TokenkegQfeZyiNwAJbNbGKPFXCWuBvf9Ss623VQ5DA",
    func(tx *client.TransactionUpdate) {
        fmt.Printf("TX: %x (slot %d)\n", tx.Signature[:8], tx.Slot)
    })

// Transactions involving a specific account
err = c.SubscribeAccount("So11111111111111111111111111111111111111112",
    func(tx *client.TransactionUpdate) {
        fmt.Printf("SOL TX: %x\n", tx.Signature[:8])
    })
```

**Subscribe to Account Updates**

```go
err = c.SubscribeAccounts(func(acc *client.AccountUpdate) {
    fmt.Printf("Account %x updated: %d lamports\n",
        acc.Pubkey[:8], acc.Lamports)
})
```

**Use Channel-Based API**

```go
import "context"

ctx, cancel := context.WithCancel(context.Background())
defer cancel()

slots, err := c.SlotChan(ctx, 100)
if err != nil {
    log.Fatal(err)
}

for slot := range slots {
    fmt.Printf("Slot %d\n", slot.Slot)
}
```
{% endstep %}
{% endstepper %}

## Next Steps

* [Authentication Guide](authentication) - Understand JWT credentials
* [Topic Reference](../reference/topics) - Complete topic schema
* [Subscription Reference](../reference/subscriptions) - Subscription patterns and filters

## Troubleshooting

<details>

<summary>Connection Refused</summary>

* Verify the server URL is correct
* Check network connectivity
* Ensure the ThorPulse server is running

</details>

<details>

<summary>Authentication Failed</summary>

* Verify credentials file exists and is readable
* Check credentials haven't expired (30-day user JWT expiry)
* Ensure account is active

</details>

<details>

<summary>No Data Received</summary>

* Check subscription topic pattern
* Verify tier allows access to requested topics
* Ensure the Solana network is producing blocks

</details>
