# Subscribe to ShredStream

This guide covers how to use ShredStream with your Thor Labs RPC authentication.

## What is ShredStream?

ShredStream is a high-performance data streaming service that provides real-time blockchain data access. When enabled for a location, you can register your IP with the ShredStream API alongside your regular RPC authentication.

## Availability

ShredStream is **not available at all locations**. Only specific RPC nodes support ShredStream integration. When authenticating to a supported location, you'll see an additional port field in the authentication modal.

{% hint style="info" %}
Check [Thor Labs Discord Server ](https://discord.gg/thorlabs)for available locations.
{% endhint %}

## How It Works

{% stepper %}
{% step %}
**Overview**

When you authenticate to a ShredStream-enabled location:

* Your IP is whitelisted for RPC access (as normal)
* Your IP is whitelisted for ThorStreamer gRPC access (as normal)
* Optionally, your IP is also registered with the ShredStream API
* Both registrations are linked — if ShredStream fails, the entire auth is rolled back
{% endstep %}
{% endstepper %}

## Authentication with ShredStream

{% stepper %}
{% step %}
**Start Authentication**

Follow the normal authentication process:

```
!rpc auth
```

Select your pass and location as usual.
{% endstep %}

{% step %}
**Enter IP and Port**

If the selected location supports ShredStream, the input modal will show two fields:

| Field                           | Description                         |
| ------------------------------- | ----------------------------------- |
| **Enter your IP**               | Your public IPv4 address (required) |
| **ShredStream Port (optional)** | Port for ShredStream access         |
{% endstep %}

{% step %}
**Decide on ShredStream**

You have two options:

* Enable ShredStream: enter a port number (e.g., `9000`) in the ShredStream Port field.
  * Port must be between **1024** and **65535**
  * This registers your IP with both RPC and ShredStream
* Skip ShredStream: leave the ShredStream Port field **blank**.
  * Only RPC authentication is performed
  * ShredStream registration is skipped
  * You can enable it later by updating your IP
{% endstep %}

{% step %}
**Confirmation**

With ShredStream enabled, you will see a confirmation similar to:

```
Access to the [Location] node has been granted for your authorized IP address: [IP] and for the pass #: [Pass ID]
ShredStream: Enabled (Port: 9000)
Node URL in #node-urls.
```

If ShredStream is not enabled, the confirmation omits the ShredStream line:

{% code title="Output (ShredStream not enabled)" %}
```
```
{% endcode %}

```
Access to the [Location] node has been granted for your authorized IP address: [IP] and for the pass #: [Pass ID]
Node URL in #node-urls.
```
{% endstep %}
{% endstepper %}

## Updating ShredStream Settings

{% stepper %}
{% step %}
**Enable ShredStream on Existing Auth**

* Run `!rpc delete`
* Select your authentication entry
* Click **Update**
* Enter your IP and the desired **ShredStream port**
{% endstep %}

{% step %}
**Disable ShredStream on Existing Auth**

* Run `!rpc delete`
* Select your authentication entry
* Click **Update**
* Enter your IP but leave the **port field blank**

The existing ShredStream registration will be removed.
{% endstep %}

{% step %}
**Change ShredStream Port**

* Run `!rpc delete`
* Select your authentication entry
* Click **Update**
* Enter your IP with the **new port number**

The old registration is deleted and a new one is created.
{% endstep %}
{% endstepper %}

## Deleting Authentication

When you delete an authentication that has ShredStream enabled:

1. RPC access is revoked (IP removed from node)
2. ShredStream registration is automatically deleted
3. Database records are cleaned up

No additional steps are needed — ShredStream cleanup is automatic.

## Error Handling

<details>

<summary>ShredStream Registration Failed</summary>

If ShredStream registration fails during authentication:

```
ShredStream registration failed: [error]. Auth rolled back.
```

What happens:

* The RPC authentication is automatically rolled back
* No partial state is left
* You can retry or skip ShredStream

</details>

<details>

<summary>ShredStream Failed on Update</summary>

If ShredStream fails during an IP update:

```
IP updated to: [IP]
Warning: ShredStream registration failed: [error]
```

What happens:

* RPC IP is updated successfully
* ShredStream registration failed
* You may need to try again or contact support

</details>

## Troubleshooting

<details>

<summary>"Invalid port. Please use a port between 1024-65535"</summary>

* Port must be a number between 1024 and 65535
* Common ports: `9000`, `8080`, `20000`

</details>

<details>

<summary>"Port must be a number"</summary>

* Only enter numeric values in the port field
* No letters, spaces, or special characters

</details>

<details>

<summary>"ShredStream registration failed: API request timed out"</summary>

* The ShredStream API may be temporarily unavailable
* Try again in a few minutes
* Leave port blank to skip ShredStream if urgent

</details>

<details>

<summary>"ShredStream registration failed: Could not connect to ShredStream API"</summary>

* Network connectivity issue to ShredStream service
* Check if the service is operational
* Contact support if issue persists

</details>

## Best Practices

* Choose consistent ports — Use the same port across authentications for easier management
* Skip if not needed — Only enable ShredStream if you actually use the streaming feature
* Monitor registrations — Keep track of which authentications have ShredStream enabled
* Update together — When changing IPs, decide if you still want ShredStream enabled

## Quick Reference

| Scenario                     | Port Field                | Result                   |
| ---------------------------- | ------------------------- | ------------------------ |
| Want ShredStream             | Enter port (e.g., `9000`) | Both RPC + ShredStream   |
| Don't want ShredStream       | Leave blank               | RPC only                 |
| Disable existing ShredStream | Leave blank on update     | ShredStream removed      |
| Change port                  | Enter new port on update  | Old removed, new created |

## Next Steps

* [Thor Pass Authentication](..) - Full authentication guide
* [Thor ShredStream](../../../../infrastructure/thor-shredstream/choose-your-data-source/shred-stream) - Learn more about the Shred Stream
* [Troubleshooting](../../troubleshooting) - More help with issues
