# Flash Node Passes

This guide covers the authentication process specifically for **Flash Pass** holders.

## What is Flash Pass?

Flash Pass is a limited-access tier that provides entry to exclusive Flash-only RPC node locations. It's designed for users who need access to specific high-demand locations at a lower entry point.

## Flash Pass Characteristics

| Feature             | Flash Pass                       |
| ------------------- | -------------------------------- |
| Renewal Fee         | $60                              |
| Rate Limit          | Up to 400 Request per Second     |
| Request Limit       | Unlimited                        |
| Pass ID Format      | `F{number}` (e.g., F123)         |
| Double IP           | Not available                    |
| Max authentications | **1 IP total**                   |
| Location access     | Flash-only locations exclusively |

## Flash-Only Locations

Flash Pass holders can **only** authenticate to these locations:

| Location       | Blockchain          |
| -------------- | ------------------- |
| Los Angeles    | Solana              |
| London         | Solana              |
| Salt Lake City | Solana              |
| Frankfurt      | Binance Smart Chain |

> **Important:** Flash Pass cannot access any other locations. Attempting to select non-Flash locations will result in an error.

## Single IP Limitation

Unlike other pass types, Flash Pass has a strict **one IP per pass** limitation:

* You can only authenticate **one IP address** total with your Flash Pass
* This IP can be at any one Flash-only location
* To change locations, you must first delete your existing authentication

## Step-by-Step Authentication

{% stepper %}
{% step %}
**Start the Process**

Open a **Direct Message** with the Auth Bot and type:

```
!rpc auth
```
{% endstep %}

{% step %}
**Select Your Flash Pass**

From the dropdown menu, select your Flash Pass (shown as `F{number}`).

> **Subscription Check:** If your Flash Pass subscription has expired, you'll need to renew before proceeding.
{% endstep %}

{% step %}
**Choose a Flash Location**

Select from the available Flash-only locations:

```
Los Angeles 🇺🇸
London 🇬🇧
Salt Lake City (Flash) 🇺🇸
Frankfurt BSC 🇩🇪
```

If you select a non-Flash location you'll receive an error message:

"You can only authenticate to Los Angeles or London with your Flash Pass."
{% endstep %}

{% step %}
**Enter Your IP Address**

Click **Auth** and enter your **public IPv4 address**.

IP requirements:

* Valid IPv4 format (e.g., `203.0.113.50`)
* Must be a **public** IP address
* Cannot be private IP ranges (10.x.x.x, 172.16-31.x.x, 192.168.x.x)
{% endstep %}

{% step %}
**Confirmation**

Upon successful authentication you will see:

"Authed IP: \[your IP]"\
"Node URL in #node-urls"
{% endstep %}
{% endstepper %}

## Changing Your Authenticated Location

Since Flash Pass only allows one IP total, to change your location:

1. Delete your current authentication using `!rpc delete`
2. Select your Flash Pass entry from the list
3. Click **Delete** to remove it
4. Run `!rpc auth` again
5. Select your new desired Flash location

## Creating Rentals with Flash Pass

Flash Pass holders can rent out their authentication slot. The pricing tier for Flash rentals is lower than Thor Pass rentals:

### Flash Pass Rental Pricing (Check discord server for recent pricing)

| Period  | IP Updates | Flash Pass Price |
| ------- | ---------- | ---------------- |
| 2 Hours | 2          | 0.25 SOL         |
| 1 Day   | 3          | 0.5 SOL          |
| 1 Week  | 5          | 1 SOL            |
| 1 Month | 9          | 2 SOL            |

### How to Create a Flash Rental

1. Run `!rpc auth` and select your Flash Pass
2. Choose a Flash-only location
3. Click **Rent** instead of **Auth**
4. Enter:
   * Renter's Discord ID
   * Rental period (`2H`, `1D`, `1W`, or `1M`)
   * Payment transaction ID

> **Note:** While you have an active rental, you cannot authenticate your own IP until the rental expires.

## Common Error Messages (FAQ)

<details>

<summary>"You can only authenticate to Los Angeles or London with your Flash Pass"</summary>

You selected a location that is not Flash-exclusive. Choose from: Los Angeles, London, Salt Lake City (Flash), or Frankfurt BSC.

</details>

<details>

<summary>"You already authenticated one IP address for your Flash Pass"</summary>

Flash Pass only allows one IP total. To authenticate a new IP:

1. Run `!rpc delete`
2. Remove your existing authentication
3. Try `!rpc auth` again

</details>

<details>

<summary>"This location is exclusive to Flash Pass only"</summary>

This message appears for non-Flash pass holders trying to access Flash locations. Only Flash Pass can access these locations.

</details>

## Flash Pass vs Other Passes

| Comparison     | Flash Pass              | Thor Pass Types         |
| -------------- | ----------------------- | ----------------------- |
| Locations      | Flash-only (4)          | All general (many)      |
| Max IPs        | 1 total                 | 4 to Unlimited          |
| Double IP      | No                      | Elite                   |
| Rental pricing | Lower tier              | Higher tier             |
| Best for       | Specific location needs | Flexible multi-location |

## Tips for Flash Pass Holders

1. **Choose wisely** - Since you only get one IP, pick the location closest to your infrastructure
2. **Check latency** - Before authenticating, verify which Flash location offers the best latency for your needs
3. **Consider rentals** - If you need temporary access to other locations, you can rent slots from other pass holders
4. **Plan changes** - Remember that changing locations requires deleting and re-authenticating

## Next Steps

* [Managing Your Authentication](../node-locations-and-access/authentication) - Learn to update and delete your IP
* [RPC Node Locations and URLs](../node-locations-and-access)
* [Renewal Guide](../renewals-and-subscriptions)
* [Rental System Guide](../node-locations-and-access/rental-system) - Rent additional locations from other users
* [Troubleshooting](../node-locations-and-access/troubleshooting) - Solutions for common issues
