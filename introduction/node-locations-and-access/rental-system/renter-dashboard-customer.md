---
description: >-
  This guide will help you navigate the features available to manage your active
  rentals efficiently.
---

# Renter Dashboard (Customer)

## **Getting Started**

After finalizing a rental agreement, the next step is to ensure your rental is verified and authenticated properly. This process grants you access to exclusive renter privileges within our Discord community. Here's how it works:

**Step 1: Vendor Submission**

Once you and your vendor agree on a rental, the vendor is responsible for submitting the necessary information to the **Auth Dashboard Bot** (for Holders) on ThorLabs Discord. This step is crucial for verifying the authenticity of your rental agreement.

**Step 2: Gaining Renter Role**

After your vendor submits the required information and the rental agreement is verified, you will be assigned the **Renter Role** within the ThorLabs Discord. This role unlocks access to **Renter Dashboard** which allows you to manage your IP slot(s).

**Step 3: Stay Informed**

You can monitor the progress of your rental verification process in the **Verification Activity Channel** on Discord. This channel provides real-time updates on rental submissions and verifications, keeping you informed every step of the way.

<figure><img src="https://2207041657-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FAWUMKqE6lUPprI84aqd8%2Fuploads%2Fgit-blob-2f89c87d65a1e890b3dc67ef6fda4fc4aa08496c%2Fimage.png?alt=media" alt=""><figcaption></figcaption></figure>

## **Manage Your Slot**

To begin interacting with the bot, simply use the `!start` command in a Direct Message (DM) to the **Renter Dashboard Bot** (Renter Dashboard #4468). This command initiates the bot's interactive features, offering you two primary options: `Auth` and `List`.

{% hint style="info" %}
**You should allow DMs in Thor Labs discord server. Otherwise the bot cannot reply.**
{% endhint %}

### **Authenticating IPs (Auth)**

1.  **Initiate Authentication:** After sending the `!start` command, click on the `Auth` button.

    <figure><img src="https://2207041657-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FAWUMKqE6lUPprI84aqd8%2Fuploads%2Fgit-blob-eb8996a626036da3b9b041753c6460ceec29a6f8%2Fimage.png?alt=media" alt="" width="563"><figcaption></figcaption></figure>
2.  **Select a Rental:** The bot will display your active rentals. Each rental will be listed with its Location, IP, and the number of Updates Left. Select the rental you wish to update the IP for.

    <figure><img src="https://2207041657-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FAWUMKqE6lUPprI84aqd8%2Fuploads%2Fgit-blob-f0edeba39b4a749aed44a2876b7a5502f8263dae%2Fimage.png?alt=media" alt="" width="563"><figcaption></figcaption></figure>
3.  **Enter New IP:** After selecting a rental, a modal dialog will pop up asking you to enter the new IP address. Ensure that you enter a valid public IPv4 address.

    <figure><img src="https://2207041657-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FAWUMKqE6lUPprI84aqd8%2Fuploads%2Fgit-blob-b626be54ae3fe5716e62f1a98bf0ee1244c56d6c%2Fimage.png?alt=media" alt="" width="563"><figcaption></figcaption></figure>
4.  **Confirmation:** Once you submit the new IP, the bot will process the update. If successful, you will receive a confirmation message along with the new IP address. If there are no updates left or if there's an error, the bot will inform you accordingly.

    <figure><img src="https://2207041657-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FAWUMKqE6lUPprI84aqd8%2Fuploads%2Fgit-blob-7724722c68ffe7673a70d06273af09dcc7d92c41%2Fimage.png?alt=media" alt="" width="530"><figcaption></figcaption></figure>

{% hint style="info" %}
**The number of IP updates is limited based on the rental period to ensure optimal network stability and security.**

* **2 Hours (2H):** 2 IP updates
* **1 Day (1D):** 3 IP updates
* **1 Week (1W):** 5 IP updates
* **1 Month (1M):** 9 IP updates
{% endhint %}

{% hint style="danger" %}
**Once your allotted IP update count for your rental period is used up, there is no way to increase it. Please plan accordingly.**
{% endhint %}

### **Listing Active Rentals (List)**

1.  **View Active Rentals:** Click on the `List` button after initiating the bot with the `!start` command.

    <figure><img src="https://2207041657-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FAWUMKqE6lUPprI84aqd8%2Fuploads%2Fgit-blob-2ccb1b75153e72c0ce91b0dfae8577d837923a80%2Fimage.png?alt=media" alt="" width="563"><figcaption></figcaption></figure>
2. **Rental Details:** The bot will fetch and display details of your active rentals, including:
   * **Blockchain and City:** The location and blockchain of the node.
   * **Vendor ID:** Your vendor's unique identifier.
   * **Rental Period:** The start and end dates of your rental period.
   * **Updates Left:** How many more times you can update the IP.
   * **Transaction ID:** Your payment transaction signature.

### **Notes**

* **Multiple Rentals:** The bot supports multiple rentals.
* **IP Updates:** When updating IPs, ensure that the IP address is a public IPv4 address. The bot will reject private IPs and IPv6 addresses.
* **Privacy:** Your rental information and interactions with the bot are handled securely.
* **Support:** If you encounter any issues or have questions, please refer to vendor.\
  <br>
