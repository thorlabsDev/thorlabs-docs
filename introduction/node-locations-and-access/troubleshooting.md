# Troubleshooting

This page covers common issues, error messages, and frequently asked questions.

## Common Error Messages

### Authorization Errors

#### "You are not authorized to use this command"

**Cause:** You're not recognized as a pass holder.

**Solutions:**

1. Ensure you own a Thor Labs Node Pass (Classic, Elite, Gold, Flash, or Prime)
2. Complete wallet verification in the Thor Labs Discord server
3. Check that your wallet holding the pass is verified
4. Wait a few minutes after verification and try again

***

#### "Subscription of this NFT has ended"

**Cause:** Your pass subscription has expired.

**Solutions:**

1. Renew your pass subscription through the official channels
2. After renewal, complete holder verification again to update the API
3. Try authentication after the API updates (may take a few minutes)

***

#### "Pass not found" or empty pass list

**Cause:** No valid passes detected for your account.

**Solutions:**

1. Verify you're using the correct Discord account
2. Re-verify your wallet in the verification channel
3. Ensure the pass NFT is in your connected wallet
4. Check if the pass has been transferred or sold

***

### Location Restriction Errors

#### "Access Restricted to Prime Pass Holders"

**Cause:** You selected a Prime-only location with a non-Prime pass.

**Solutions:**

* Choose a different location available to your pass type
* Consider upgrading to Prime Pass for exclusive access
* Check the location list for locations matching your pass

***

#### "Access Restricted to Elite Pass Holders"

**Cause:** You selected an Elite-only location with a Classic or Flash pass.

**Solutions:**

* Choose a general location instead
* Upgrade to Elite or Gold pass for Elite-only access

***

#### "You can only authenticate to Los Angeles or London with your Flash Pass"

**Cause:** Flash Pass can only access Flash-exclusive locations.

**Solutions:**

* Select Los Angeles, London, Salt Lake City, or Frankfurt BSC
* These are the only locations available to Flash Pass

***

#### "This location is exclusive to Flash Pass only"

**Cause:** Non-Flash pass tried to access a Flash-exclusive location.

**Solutions:**

* Choose a different location
* Purchase a Flash Pass for Flash-exclusive access
* Rent a slot from a Flash Pass holder

***

### Double IP Errors

#### "Double IP usage already active"

**Cause:** You've already used double IP for this pass.

**Solutions:**

1. Run `!rpc delete` to view your authentications
2. Find and delete the entry marked "Yes" in the Double column
3. Then you can use double IP at a different location

***

### IP Address Errors

#### "Invalid IP address format"

**Cause:** The IP you entered is not a valid IPv4 format.

**Solutions:**

* Use format: `xxx.xxx.xxx.xxx` (e.g., `192.168.1.1`)
* Each segment must be 0-255
* No letters, spaces, or special characters

***

#### "Use a public IPv4 address"

**Cause:** You entered a private IP address.

**Private IP ranges (not allowed):**

* `10.0.0.0` - `10.255.255.255`
* `172.16.0.0` - `172.31.255.255`
* `192.168.0.0` - `192.168.255.255`

**Solutions:**

* Find your public IP at [whatismyip.com](https://whatismyip.com/)
* Use the public IP, not your local network IP
* If behind NAT, use your router's external IP

***

### Rental Errors

#### "Invalid Discord ID"

**Cause:** The Discord ID entered is not a valid numeric ID.

**Solutions:**

* Discord IDs are 17-19 digit numbers
* Enable Developer Mode in Discord settings
* Right-click on a user → "Copy ID"

***

#### "Invalid rental period"

**Cause:** The period entered doesn't match expected values.

**Valid periods:**

* `2H` - 2 hours
* `1D` - 1 day
* `1W` - 1 week
* `1M` - 1 month

**Note:** Case matters - use uppercase letters.

***

#### "Invalid Transaction ID"

**Cause:** The transaction ID format is incorrect.

**Solutions:**

* Transaction IDs are long alphanumeric strings
* Copy directly from your wallet or Solscan
* Ensure no extra spaces or characters

***

#### "The user is not a member of the server"

**Cause:** The renter is not in Thor Labs Discord.

**Solutions:**

* Renter must join the Thor Labs Discord server first
* Try again after they've joined
* Verify the Discord ID is correct

***

#### "Transaction details could not be retrieved"

**Cause:** Transaction verification failed.

**Solutions:**

* Ensure the transaction is recent (within a few hours)
* Wait for blockchain confirmation
* Check transaction is on Solana mainnet
* Verify the transaction ID is correct

***

#### "This TX is already used for another rental"

**Cause:** The transaction was already used for a previous rental.

**Solutions:**

* Create a new payment transaction
* Each rental requires a unique transaction

***

#### "Receiver wallet is not registered"

**Cause:** Payment went to a wallet not linked to your account.

**Solutions:**

* Ensure payment goes to one of your registered wallets
* Check your registered wallets in the verification database
* Add the receiving wallet to your verification

***

#### "Transaction amount cannot be lower than floor price"

**Cause:** Payment was less than the required amount.

**Floor prices:**

| Period | Thor Pass | Flash Pass |
| ------ | --------- | ---------- |
| 2H     | 0.5 SOL   | 0.25 SOL   |
| 1D     | 1 SOL     | 0.5 SOL    |
| 1W     | 2 SOL     | 1 SOL      |
| 1M     | 4 SOL     | 2 SOL      |

***

#### "Request Denied: ongoing rental"

**Cause:** Trying to delete an entry with an active rental.

**Solutions:**

* Wait for the rental to expire
* Check rental expiration with `!rpc rents`
* Cannot cancel rentals early

***

### Connection Errors

#### "The node is currently inaccessible"

**Cause:** Cannot connect to the RPC node server.

**Solutions:**

* Wait a few minutes and try again
* Node may be undergoing maintenance
* Contact Thor Labs support if issue persists

***

#### Timeout Errors

**Cause:** You took too long to respond (60 second limit).

**Solutions:**

* Have your information ready before starting
* Run the command again
* Respond promptly to each step

***

## Error Codes

When reporting issues, include the error code shown:

| Code  | Location   | Description                           |
| ----- | ---------- | ------------------------------------- |
| Dx70  | User fetch | Failed to retrieve user info from API |
| Dx260 | Remark     | Error selecting remark entry          |
| Dx279 | Runtime    | General authentication error          |
| Rx306 | Database   | Failed to insert rental record        |
| Rx318 | Rental     | Rental processing error               |
| Hx124 | Rental     | Rental submission error               |
| Hx138 | IP         | IP whitelisting failed                |
| Hx152 | IP         | IP deletion failed                    |

***

## Frequently Asked Questions

### General Questions

<details>

<summary>Do commands work in server channels?</summary>

No, all `!rpc` commands must be run in **Direct Messages** with the Auth Bot.

</details>

<details>

<summary>How do I find my Discord ID?</summary>

Enable Developer Mode in Discord settings (User Settings → App Settings → Advanced → Developer Mode). Then right-click on your name and select "Copy ID."

</details>

<details>

<summary>Can I authenticate multiple IPs with one pass?</summary>

It depends on your pass type:

* **Classic/Flash/Honorary:** One location at a time (Flash: 1 IP total)
* **Elite/Gold:** Multiple locations, plus optional double IP at one location
* **Prime:** 1 IP per shared location (4 total, can repeat same location) + unlimited on dedicated RPC

</details>

<details>

<summary>How long does authentication take?</summary>

Authentication is nearly instant. Once you submit your IP, it's typically whitelisted within seconds.

</details>

### Pass Questions

<details>

<summary>What's the difference between Elite and Gold?</summary>

Elite and Gold passes have identical features and access levels. They're different tiers from different releases but function the same.

</details>

<details>

<summary>Can I use the same pass on multiple locations?</summary>

Yes! You can authenticate different IPs at different locations with the same pass (except Flash, which is limited to 1 IP total).

</details>

<details>

<summary>What happens if my pass expires?</summary>

Your existing authentications remain active, but you cannot create new ones or modify existing ones until you renew.

</details>

### Location Questions

<details>

<summary>Why can't I access certain locations?</summary>

Some locations are restricted by pass type:

* **Prime-only:** Only Prime Pass
* **Elite-only:** Only Elite, Gold, and Prime
* **Flash-only:** Only Flash Pass

</details>

<details>

<summary>What are location groups?</summary>

Some cities have multiple nodes (e.g., New York has locations 2 and 17). If you authenticate to one node in a group, you can't also authenticate to another node in the same group with the same pass.

</details>

### Rental Questions

<details>

<summary>How do renters set their IP?</summary>

Renters use the Rent Management Bot by DMing it with `!start`. They can then update their IP through the dashboard.

</details>

<details>

<summary>Can I cancel a rental early?</summary>

No, rentals run for their full duration. Plan accordingly when choosing rental periods.

</details>

<details>

<summary>What happens when a rental expires?</summary>

The renter's IP is automatically removed, and the slot becomes available again. The pass holder can then authenticate their own IP or create a new rental.

</details>

<details>

<summary>Can I rent out multiple slots?</summary>

Yes! Each location you've authenticated can potentially be rented out. You can have multiple active rentals across different locations.

</details>

### Technical Questions

<details>

<summary>What is a gRPC token?</summary>

gRPC tokens are authentication credentials for gRPC-enabled RPC endpoints. They're automatically generated when you whitelist an IP at supported locations.

</details>

<details>

<summary>Why did my gRPC token change?</summary>

gRPC tokens are regenerated when you update your IP address. The old token becomes invalid.

</details>

<details>

<summary>Can I use multiple IPs at the same time?</summary>

Only with Double IP feature (Elite/Gold/Prime). Otherwise, you have one IP per location. Updating an IP replaces the previous one.

</details>

***

## Getting Help

If your issue isn't covered here:

1. **Check error code** - Note any error codes displayed
2. **Gather details** - Your pass type, what you were trying to do, exact error message
3. **Contact support** - Reach out in the Thor Labs Discord support channel
4. **Be specific** - Provide as much detail as possible

### Information to Include

When reporting an issue:

* Your Discord username
* Pass type (Classic, Elite, Gold, Flash, Prime)
* Command you were running
* Full error message
* Any error code shown
* Steps that led to the error
