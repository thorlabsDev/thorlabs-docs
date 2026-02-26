# Rental System

This guide explains how to rent RPC node access from pass holders and manage your rentals.

## Overview

The Thor Labs rental system allows users without Node Passes to temporarily access RPC nodes by renting slots from existing pass holders. This is handled through two separate bots:

| Bot                      | Purpose                                |
| ------------------------ | -------------------------------------- |
| **ThorRent Bot**         | Rental creation and payment processing |
| **Renter Dashboard Bot** | IP management for active rentals       |

## Rental Pricing

{% hint style="warning" %}
**Check discord server for the most recent pricing**
{% endhint %}

### Thor Pass Rentals (Classic, Elite, Gold)

| Period  | Price   | IP Updates |
| ------- | ------- | ---------- |
| 2 Hours | 0.5 SOL | 2          |
| 1 Day   | 1 SOL   | 3          |
| 1 Week  | 2 SOL   | 5          |
| 1 Month | 4 SOL   | 9          |

### Flash Pass Rentals

| Period  | Price    | IP Updates |
| ------- | -------- | ---------- |
| 2 Hours | 0.25 SOL | 2          |
| 1 Day   | 0.5 SOL  | 3          |
| 1 Week  | 1 SOL    | 5          |
| 1 Month | 2 SOL    | 9          |

{% hint style="info" %}
**Prime Pass holders have dedicated RPCs with unlimited IPs and do not participate in the rental system.**
{% endhint %}

## How to Rent a Slot

### Method 1: Through ThorRent Interface

Many Discord servers have our rental interface posted by collaborators. Look for the **ThorRent** bot and a **Rent** button.

{% stepper %}
{% step %}
**Find the Rental Bot**

<figure><img src="https://2207041657-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FAWUMKqE6lUPprI84aqd8%2Fuploads%2Fgit-blob-83968ec3e3ac1bc97b8c2edb15625fb77f073e80%2Fimage.png?alt=media" alt="" width="375"><figcaption></figcaption></figure>
{% endstep %}

{% step %}
**Click the Rent Button**

Click **Rent** to open the rental flow.
{% endstep %}

{% step %}
**Select Location**

Choose your desired location from the dropdown:

```
Los Angeles 🇺🇸
London 🇬🇧
Salt Lake City 🇺🇸
Frankfurt BSC 🇩🇪
```
{% endstep %}

{% step %}
**Fill in Rental Details**

A modal will appear with these fields:

| Field          | Description                                    | Example                   |
| -------------- | ---------------------------------------------- | ------------------------- |
| Discord ID     | Your Discord user ID (optional if auto-filled) | 123456789012345678        |
| Rental Period  | Duration code                                  | `2H`, `1D`, `1W`, or `1M` |
| Transaction ID | Solana transaction signature                   | `5KtPn1...`               |
{% endstep %}

{% step %}
**Submit Payment**

Before filling the modal:

* Send the correct SOL amount to the vendor's wallet
* Copy the transaction ID from your wallet or Solscan
* Paste the transaction ID in the modal
{% endstep %}

{% step %}
**Confirmation**

Upon successful validation:

* You'll receive a confirmation message
* Your rental is now active
* Use the Rent Management Bot to set your IP
{% endstep %}
{% endstepper %}

### Method 2: Direct from Pass Holder

Pass holders can create rentals directly during their authentication flow:

{% stepper %}
{% step %}
Pass holder runs `!rpc auth`
{% endstep %}

{% step %}
Selects their pass and location
{% endstep %}

{% step %}
Clicks **Rent** instead of **Auth**
{% endstep %}

{% step %}
Enters your Discord ID, period, and transaction ID
{% endstep %}
{% endstepper %}

## Managing Your Rentals

Once you have an active rental, use the **Renter Dashboard Bot** to manage it.<br>

<div data-with-frame="true"><figure><img src="https://2207041657-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FAWUMKqE6lUPprI84aqd8%2Fuploads%2Fgit-blob-3cd5f59841e8e252811d8bfff0c90883f6967d83%2Fimage.png?alt=media" alt=""><figcaption></figcaption></figure></div>

### Starting the Dashboard

Send a DM to the Rent Management Bot:

```
!start
```

This opens the rental management dashboard.

### Dashboard Options

The dashboard presents three buttons:

| Button           | Function                     |
| ---------------- | ---------------------------- |
| **Update IP**    | Change your authenticated IP |
| **View Rentals** | See all your active rentals  |
| **View Tokens**  | Display your gRPC tokens     |

## Updating Your IP

{% stepper %}
{% step %}
**Click "Update IP"**

From the dashboard, click the **Update IP** button.
{% endstep %}

{% step %}
**Select the Rental**

A dropdown appears listing your active rentals:

```
Los Angeles - Solana (2 updates left)
London - Ethereum (5 updates left)
```
{% endstep %}

{% step %}
**Enter New IP**

A modal opens for IP input:

* Enter your **public IPv4 address**
* Must be a valid format (e.g., `203.0.113.50`)
* Cannot be a private IP address
{% endstep %}

{% step %}
**Confirmation**

Upon success:

* Old IP is removed from the node
* New IP is whitelisted
* gRPC token is generated (if applicable)
* Update count is decremented
{% endstep %}
{% endstepper %}

{% hint style="warning" %}
Each rental has limited IP updates. Use them wisely!
{% endhint %}

## Viewing Your Rentals

Click **View Rentals** to see detailed information:

```
Los Angeles - Solana
🌐 Current IP: 203.0.113.50
👤 Vendor: @PassHolder#1234
📅 Started: Jan 15, 2025, 10:00 AM
⏰ Expires: Jan 22, 2025, 10:00 AM (in 5 days)
🔄 IP Updates Remaining: 3
🔑 Transaction: 5KtPn1abc123...
🔐 gRPC Token: tkn_xyz789...
```

### Rental Information Fields

| Field                | Description                             |
| -------------------- | --------------------------------------- |
| Current IP           | Your whitelisted IP address             |
| Vendor               | The pass holder you rented from         |
| Started              | When the rental began                   |
| Expires              | When the rental ends                    |
| IP Updates Remaining | How many times you can change your IP   |
| Transaction          | Your payment transaction ID             |
| gRPC Token           | Authentication token for gRPC endpoints |

## Viewing Your gRPC Tokens

For locations that support gRPC, click **View Tokens**:

```
Los Angeles - Solana
🌐 IP: 203.0.113.50
🔑 Token: tkn_grpc_abc123xyz789
⏰ Expires: in 5 days
```

### Using gRPC Tokens

gRPC tokens are required for accessing gRPC-enabled endpoints:

* Copy the token from the bot message
* Include it in your gRPC requests as authentication
* Token is valid until rental expiration
* New token is generated each time you update your IP

## IP Update Limits

Each rental period comes with a specific number of IP updates:

| Period  | Total Updates | Notes               |
| ------- | ------------- | ------------------- |
| 2 Hours | 2             | Short-term access   |
| 1 Day   | 3             | Daily flexibility   |
| 1 Week  | 5             | Weekly needs        |
| 1 Month | 9             | Long-term stability |

### What Counts as an Update?

* Setting your initial IP counts as 1 update
* Each IP change after that counts as 1 update
* When updates reach 0, you cannot change your IP again

### Tips for Managing Updates

* Set up correctly first — Verify your IP before setting it
* Use static IPs — Avoid dynamic IPs that change frequently
* Plan ahead — Know when you might need to change IPs
* Consider longer periods — More updates for longer rentals

## Rental Expiration

### What Happens When a Rental Expires?

* Your IP is automatically removed from the node
* gRPC token becomes invalid
* Access to the RPC endpoint stops
* Rental record is marked as expired

### Before Expiration

* Check expiration date in **View Rentals**
* Plan renewal if needed
* Save any necessary data

### Renewing a Rental

To continue access:

* Create a new rental through ThorRent interface
* Or contact the same vendor for a direct renewal
* Set your IP again on the new rental

## Common Issues

<details>

<summary>"No active rentals found"</summary>

* Ensure you're using the same Discord account that rented
* Check if your rental has expired
* Verify the rental was created successfully

</details>

<details>

<summary>"No IP updates remaining"</summary>

* You've used all your IP updates for this rental
* Consider creating a new rental for more updates
* Choose a longer rental period next time

</details>

<details>

<summary>"Invalid IP address"</summary>

* Use a valid IPv4 format
* Must be a public IP, not private
* Check your IP at whatismyip.com

</details>

<details>

<summary>Transaction Validation Failed</summary>

* Ensure the transaction is recent
* Verify the correct amount was sent
* Check that payment went to the vendor's registered wallet
* Wait a moment for blockchain confirmation

</details>

## Renters vs Pass Holders

| Aspect          | Renters            | Pass Holders                  |
| --------------- | ------------------ | ----------------------------- |
| Access duration | Rental period only | Permanent (while pass active) |
| IP updates      | Limited per rental | Unlimited                     |
| Location choice | Pre-selected       | Any available                 |
| Double IP       | Not available      | Elite/Gold/Prime only         |
| Cost            | Per rental         | NFT and renewal               |
| Management      | Individual         | Individual                    |

## Next Steps

* [Troubleshooting](troubleshooting) - Solutions for common issues
* [Thor Pass Authentication](authentication) - Consider purchasing a pass
