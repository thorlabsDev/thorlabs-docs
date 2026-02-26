---
description: How to auth your IP?
---

# Authentication

{% hint style="danger" %}
**Make sure your DM is open for this server. Otherwise @Dashboard cannot reply and you cannot authorize your IP.**
{% endhint %}

## Step-by-Step Authentication

{% stepper %}
{% step %}
**Start the Process**

Open a **Direct Message** with the Auth Bot and type:

```
!rpc auth
```

{% hint style="info" %}
This command only works in DMs, not in server channels.
{% endhint %}
{% endstep %}

{% step %}
**Select Your Pass**

A dropdown menu will appear showing all your eligible passes. Each pass is displayed with its ID format:

* `C123` - Classic Pass #123
* `E456` - Elite Pass #456
* `G789` - Gold Pass #789

Select the pass you want to use for authentication.

{% hint style="warning" %}
If your pass subscription has expired, you'll see a message asking you to renew before proceeding.
{% endhint %}
{% endstep %}

{% step %}
**Choose a Location**

A location selection dropdown will appear, organized by blockchain:

```
1. Solana - Germany 🇩🇪
2. Ethereum - New York 🇺🇸
3. Polygon - France 🇫🇷
...
```

Select your preferred RPC node location.

**Location Restrictions**

* **Elite-Only Locations:** Some locations are exclusive to Elite and Gold pass holders
* **Location Groups:** Certain cities have multiple nodes (e.g., New York). If you authenticate to one node in a group, you cannot authenticate to another node in the same group with the same pass
{% endstep %}

{% step %}
**Double IP Option (Elite/Gold Only)**

If you're using an Elite or Gold pass, you'll be asked:

> "As an Elite Pass holder, you have the privilege of authorizing two IP addresses for one selected location. Would you like to authorize a second IP address?"

* Click **Yes** if you already have one IP at this location and want to add a second
* Click **No** if this is your first IP at this location

**Double IP Restrictions**

* Can only be used **once per pass** across all locations
* Must have an existing single IP at the location first
{% endstep %}

{% step %}
**Enter Your IP Address**

Two buttons will appear:

* **Auth** - Enter your IP address directly
* **Rent** - Create a rental for another user

Click **Auth** and enter your **public IPv4 address** in the modal that appears.

**IP Requirements**

* Must be a valid IPv4 format (e.g., `123.45.67.89`)
* Must be a **public** IP address (not private ranges like 10.x.x.x, 172.16-31.x.x, 192.168.x.x)
* Use sites like [whatismyip.com](https://whatismyip.com/) to find your public IP
{% endstep %}

{% step %}
**Confirmation**

Upon successful authentication, you'll receive:

> "Authed IP: \[your IP]" "Node URL in #node-urls"

Your IP is now whitelisted and you can access the RPC node immediately.
{% endstep %}
{% endstepper %}

## Using Double IP (Elite/Gold)

The Double IP feature allows Elite and Gold pass holders to whitelist two IP addresses at a single location. This is useful for:

* Home and office access
* Multiple devices on different networks
* Backup connection from a VPS

### How to Enable Double IP

{% stepper %}
{% step %}
**Primary IP**

First, authenticate your primary IP normally (select "No" at the double IP prompt).
{% endstep %}

{% step %}
**Re-run Auth**

Run `!rpc auth` again with the same pass.
{% endstep %}

{% step %}
**Select Same Location**

Select the same location.
{% endstep %}

{% step %}
**Accept Double IP**

When prompted about double IP, click **Yes**.
{% endstep %}

{% step %}
**Enter Second IP**

Enter your second IP address.
{% endstep %}
{% endstepper %}

### Double IP Tracking

<details>

<summary>Details about double IP usage</summary>

* Once you use double IP for a pass, you cannot use it again with that pass at a different location
* Delete the double IP authorization if you want to use the feature at a different location

</details>

## Creating a Rental

Pass holders can rent out their authentication slots to other users. When clicking **Rent** instead of **Auth**:

{% stepper %}
{% step %}
**Enter Renter ID**

Enter the **Renter's Discord ID** (numeric ID).
{% endstep %}

{% step %}
**Select Rental Period**

Select the **Rental Period**: `2H`, `1D`, `1W`, or `1M`.
{% endstep %}

{% step %}
**Provide Transaction ID**

Provide the **Transaction ID** from the SOL payment.
{% endstep %}
{% endstepper %}

### Rental Pricing

| Period  | IP Updates | Thor Pass Price |
| ------- | ---------- | --------------- |
| 2 Hours | 2          | 0.5 SOL         |
| 1 Day   | 3          | 1 SOL           |
| 1 Week  | 5          | 2 SOL           |
| 1 Month | 9          | 4 SOL           |

{% hint style="warning" %}
**Check discord server for the most recent pricing**
{% endhint %}

### Rental Requirements

* Renter must be a member of the Thor Labs Discord server
* Payment must be sent to one of your registered wallets
* Transaction must be recent and verifiable

## Viewing Your Rentals

To see all active rentals you've created:

```
!rpc rents
```

This displays:

* Renter information
* Time period and expiration
* Remaining IP updates
* Transaction ID
