# Rent your slot (Holder)

### Rent your spot

This command allows the user to give their IP slot to a user in OTC. This bot also secures enforced floor prices by validating transactions between renter and vendor.

After using `!rpc auth` select your pass and location then hit `rent` button,

<figure><img src="https://2207041657-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FAWUMKqE6lUPprI84aqd8%2Fuploads%2Fgit-blob-f8a714538b45dffbe239da74100d2061795f961e%2FScreen%20Shot%202024-02-19%20at%2000.00.24.png?alt=media" alt="" width="563"><figcaption></figcaption></figure>

### A modal dialog window pops up and you need to provide following information:

<figure><img src="https://2207041657-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FAWUMKqE6lUPprI84aqd8%2Fuploads%2Fgit-blob-96d961e3c70fa6c5cfc3391c6b3761f00ea3a35e%2FScreen%20Shot%202024-02-19%20at%2000.00.34.png?alt=media" alt="" width="557"><figcaption></figcaption></figure>

{% hint style="warning" %}
**To obtain a Discord ID in numerical format, first ensure Developer Mode is enabled in your Discord settings. This can be found under `User Settings > Advanced > Developer Mode`. Once activated, right-click on the renter's name in the Discord server and select `Copy ID` to capture their unique numerical Discord ID.**
{% endhint %}

### Example Input:

<figure><img src="https://2207041657-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FAWUMKqE6lUPprI84aqd8%2Fuploads%2Fgit-blob-2ed50bd9fbfd4200eb971b745a2b1bb8d742ddce%2FScreen%20Shot%202024-02-19%20at%2000.01.01.png?alt=media" alt="" width="546"><figcaption></figcaption></figure>

## Stop renting

Once your rental is initiated, the agreement is locked in and cannot be manually terminated early. The revocation of access is automatically handled by our system at the end of your rental period. Until then, it is not possible to modify or cancel your slot reservation. Rest assured, renter's access will seamlessly expire once the rental duration concludes and your slot will be free to use again.

{% hint style="danger" %}
**If you're currently renting and decide you want to list or sell your pass, you must first settle up by returning the full amount to the treasury (thornode.sol). Be aware that if you attempt to list your pass for sale while it's still under rental, the pass will be immediately burned as a consequence. This measure ensures fair play and maintains the integrity of the rental system.**
{% endhint %}

## List rentings

Use`!rpc rents` command to list your active rentals,

<figure><img src="https://2207041657-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FAWUMKqE6lUPprI84aqd8%2Fuploads%2Fgit-blob-7301bd19edfae9051533183259c82aaa847b1dfa%2Fimage.png?alt=media" alt=""><figcaption></figcaption></figure>
