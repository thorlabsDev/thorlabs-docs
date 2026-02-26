# Managing Authentications

This guide covers how to view, update, delete, and manage your authenticated IP addresses and related settings.

## Viewing Your Authentications

### Using the Delete Command

To see all your current authentications, run in DM:

```
!rpc delete
```

This displays a table of all your authenticated entries:

```
| #  | NFT   | IP            | LOC | Double? |
|----|-------|---------------|-----|---------|
| 1  | E123  | 203.0.113.50  | 2   | No      |
| 2  | E123  | 198.51.100.25 | 2   | Yes     |
| 3  | C456  | 192.0.2.100   | 5   | No      |
| 4  | F789  | 10.20.30.40   | 12  | No      |
```

After the table, you'll see:

* General location IDs and names
* Prime location IDs (if you have Prime passes)

Type `exit` to close without making changes.

## Updating an IP Address

{% stepper %}
{% step %}
**View Your Authentications**

Run:

```
!rpc delete
```
{% endstep %}

{% step %}
**Select the Entry**

Type the row number of the entry you want to update, for example:

```
1
```
{% endstep %}

{% step %}
**Choose Update**

Two buttons appear:

* Update — Change the IP address
* Delete — Remove the authentication

Click Update.
{% endstep %}

{% step %}
**Enter New IP**

A modal opens for IP input:

* Enter your new public IPv4 address
* Must be valid format (e.g., `203.0.113.100`)
{% endstep %}

{% step %}
**Confirmation**

Upon success:

"IP updated successfully"

What happens behind the scenes:

1. Old IP is removed from the node
2. Old gRPC token is invalidated
3. New IP is whitelisted
4. New gRPC token is generated (if applicable)
5. Database is updated
{% endstep %}
{% endstepper %}

## Deleting an Authentication

{% stepper %}
{% step %}
**View Your Authentications**

Run:

```
!rpc delete
```
{% endstep %}

{% step %}
**Select the Entry**

Type the row number, for example:

```
2
```
{% endstep %}

{% step %}
**Choose Delete**

Click the Delete button.
{% endstep %}

{% step %}
**Confirmation**

Upon success:

"\[IP] removed successfully from: \[Location Name]"\
"You may now assign a new IP address to the node if needed."

What happens behind the scenes:

1. IP is removed from node firewall/config
2. gRPC token is deleted from node
3. Database record is removed
4. Location slot becomes available again
{% endstep %}
{% endstepper %}

### Deleting Rental Authorizations

If you try to delete an entry that's being rented out:

"Request Denied: Your revoke process cannot proceed due to an ongoing rental. Please wait until the current rental period concludes."

You must wait until the rental expires before deleting.

## Adding Remarks

{% stepper %}
{% step %}
**Run the Remark Command**

```
!rpc remark
```
{% endstep %}

{% step %}
**View Your Entries**

A table appears showing current remarks:

```
| #  | NFT   | LOC | Double? | RMK           |
|----|-------|-----|---------|---------------|
| 1  | E123  | 2   | No      | Home server   |
| 2  | E123  | 2   | Yes     | Office        |
| 3  | C456  | 5   | No      |               |
```
{% endstep %}

{% step %}
**Select Entry**

Type the row number:

```
3
```
{% endstep %}

{% step %}
**Enter Remark**

"Please enter the remark you want to add to your authenticated entry."

Type your remark:

```
Trading bot server
```
{% endstep %}

{% step %}
**Confirmation**

"Remark added successfully."
{% endstep %}
{% endstepper %}

## Viewing gRPC Tokens

For locations that support gRPC authentication:

```
!rpc token
```

Output:

```
* Pass: E123
* Country: Germany 🇩🇪
* Double?: No
* IP: 203.0.113.50
* gRPC Token: tkn_abc123xyz789

* Pass: E123
* Country: Germany 🇩🇪
* Double?: Yes
* IP: 198.51.100.25
* gRPC Token: tkn_def456uvw012
```

Using gRPC Tokens:

* Include the token in your gRPC requests for authentication. The token format and usage depends on the specific RPC implementation.

## Viewing Active Rentals (Pass Holders)

To see rentals you've created for others:

```
!rpc rents
```

Output:

```
## Your active rentals:

**New York - Ethereum**
* Renter ID: @User#1234
* Time Period: Jan 15, 2025 → Jan 22, 2025
* Ends in 5 days
* Updates Left: 3
* Transaction ID: 5KtPn1abc123...
```

## Managing Double IP

### Checking Double IP Status

The delete table shows which entries use double IP:

```
| #  | NFT   | IP            | LOC | Double? |
|----|-------|---------------|-----|---------|
| 1  | E123  | 203.0.113.50  | 2   | No      |
| 2  | E123  | 198.51.100.25 | 2   | Yes     |
```

### Removing Double IP

1. Run `!rpc delete`
2. Select the entry marked "Yes" in Double column
3. Click Delete
4. Now you can use double IP at a different location

### Authentication Rules Reminder

* Elite/Gold: One double IP per pass total (any general location)
* Prime: 1 IP per shared location (4 locations) + unlimited on dedicated RPC
* Classic/Flash/Honorary: Single IP, no double IP

## Best Practices

### Organizing Your Authentications

* Use remarks — Label each entry with its purpose
* Track locations — Note which physical locations you're using
* Monitor double IP — Keep track of where you've used it

### Security Recommendations

* Update IPs promptly — Change IPs when your network changes
* Remove unused entries — Delete authentications you no longer need
* Protect gRPC tokens — Treat tokens like passwords
* Use static IPs — Dynamic IPs may cause access issues

### Managing Multiple Passes

* Spread locations — Use different passes for different regions
* Track by pass — The NFT column helps identify which pass is used
* Plan double IP — Decide which pass to use for double IP locations

## Troubleshooting

<details>

<summary>"You have made an invalid choice"</summary>

* Enter a valid row number from the displayed table
* Numbers must match exactly (1, 2, 3, etc.)

</details>

<details>

<summary>"The node is currently inaccessible"</summary>

* Node server may be temporarily down
* Try again in a few minutes
* Contact support if issue persists

</details>

<details>

<summary>Timeout Errors</summary>

* The bot waits 60 seconds for responses
* If you timeout, run the command again
* Have your information ready before starting

</details>

<details>

<summary>"Request Denied: ongoing rental"</summary>

* Cannot delete entries with active rentals
* Wait for rental to expire
* Or contact the renter to end early (if needed)

</details>

## Quick Reference

| Command       | Purpose                                 |
| ------------- | --------------------------------------- |
| `!rpc delete` | View, update, or delete authentications |
| `!rpc remark` | Add notes to entries                    |
| `!rpc token`  | View gRPC tokens                        |
| `!rpc rents`  | View rentals you've created             |
| `!rpc help`   | Display help information                |

## Next Steps

* [Authentication](managing-authentications/authenticate-your-ip) - Add new authentications
* [Add remarks ](managing-authentications/add-remarks)- Add remarkable notes for your authenticated IPs
* [Rental System Guide](../rental-system) - Create or manage rentals
* [Troubleshooting](../troubleshooting) - More help with issues
