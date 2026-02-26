# Prime Pass Authentication

This guide covers the authentication process for **ThorNode Prime Pass** holders - the premium managed dedicated RPC tier.

## Step-by-Step Authentication

### Authenticating to Shared Locations

{% stepper %}
{% step %}
**Start the Process**

Open a **Direct Message** with the Auth Bot and type:

```
!rpc auth
```
{% endstep %}

{% step %}
**Select Your Prime Pass**

From the dropdown menu, select your Prime Pass:

* `P{number}` - Prime Pass format
* `T{number}` - Alternative Prime Pass format

{% hint style="info" %}
Ensure your Prime Pass subscription is active before proceeding.
{% endhint %}
{% endstep %}

{% step %}
**Choose Your Location**

Select from your 4 designated shared locations.
{% endstep %}

{% step %}
**Enter Your IP Address**

Click **Auth** and enter your **public IPv4 address** in the modal.

IP Requirements:

* Valid IPv4 format (e.g., `198.51.100.25`)
* Must be a **public** IP address
* Cannot use private IP ranges (10.x.x.x, 172.16-31.x.x, 192.168.x.x)
{% endstep %}

{% step %}
**Confirmation**

Upon successful authentication you will see:

"Authed IP: \[your IP]"\
"Node URL in #node-urls"
{% endstep %}
{% endstepper %}

### Authenticating to Your Dedicated RPC

Your dedicated standalone RPC has **unlimited IP authentications**:

{% stepper %}
{% step %}
Run the command:

```
!rpc auth
```
{% endstep %}

{% step %}
Select your Prime Pass from the dropdown.
{% endstep %}

{% step %}
Choose your dedicated RPC location.
{% endstep %}

{% step %}
Enter an IP address in the modal.
{% endstep %}

{% step %}
Repeat as many times as needed — there are no limits for the dedicated RPC.
{% endstep %}
{% endstepper %}

## Managing Your Authentications

### View All Authentications

```
!rpc delete
```

Shows all your authenticated IPs across shared locations and your dedicated RPC.

### Update an IP

{% stepper %}
{% step %}
Run:

```
!rpc delete
```

This displays your authenticated entries.
{% endstep %}

{% step %}
Select the entry you want to update.
{% endstep %}

{% step %}
Click **Update** and enter the new IP address.
{% endstep %}
{% endstepper %}

### Remove an IP

{% stepper %}
{% step %}
Run:

```
!rpc delete
```
{% endstep %}

{% step %}
Select the entry to remove.
{% endstep %}

{% step %}
Click **Delete**.
{% endstep %}
{% endstepper %}

### View gRPC Tokens

```
!rpc token
```

Displays your gRPC tokens for locations that support it.

## 24/7 Support

As a Prime Pass holder, you have access to dedicated 24/7 support:

* Priority response times
* Direct communication channel
* Technical assistance for your dedicated infrastructure

Contact Thor Labs support through the Discord server for any issues or requests.

## Prime Pass vs Other Passes

| Feature                      | Classic/Elite/Gold         | Flash             | **Prime**               |
| ---------------------------- | -------------------------- | ----------------- | ----------------------- |
| Shared Locations             | Yes                        | 4 Flash locations | **4 of your choice**    |
| IPs per Shared Location      | 1 (2 with Elite double IP) | 1                 | **1 per location**\*    |
| Same Location Multiple Times | Yes to Elite only          | No                | **Yes**                 |
| Dedicated RPC                | No                         | No                | **Yes (unlimited IPs)** |
| Setup                        | Instant                    | Instant           | 2-3 business days       |
| Support                      | Standard                   | Standard          | **24/7 dedicated**      |

\*Can select same location multiple times for multiple IPs on one endpoint

## Example: Prime Pass Advantage

Scenario: You need 4 IPs accessing the Virginia endpoint.

| Pass Type  | Can Do This?                                                |
| ---------- | ----------------------------------------------------------- |
| Classic    | No - only 1 IP per location                                 |
| Elite/Gold | No - max 2 IPs with double IP feature                       |
| Flash      | No - only 1 IP total                                        |
| **Prime**  | **Yes** - select Virginia 4 times during setup (as example) |

Plus, your dedicated RPC allows unlimited additional IPs!

## Getting Started with Prime

Interested in ThorNode Prime Pass?

1. Check availability (only 10 total)
2. Contact Thor Labs team to discuss your requirements
3. Select your 4 shared locations (can repeat locations)
4. Receive your dedicated RPC within 2-3 business days
5. Start authenticating - 1 IP per shared location, unlimited on dedicated

## Next Steps

* [Managing Your Authentication](managing-authentications) - Detailed IP management guide
* [Troubleshooting](../troubleshooting) - Solutions for common issues
