# Setup

{% stepper %}
{% step %}
**Pre-Setup**

* Contact Thor Labs to register your server (provide guild\_id, server name)
* Agree on revenue share percentage
* Create a rental channel in your server
{% endstep %}

{% step %}
**Invite Bots**

Thor Labs provides two bots for the rental flow.

[ThorRent Bot](https://discord.com/oauth2/authorize?client_id=1163557139911024772) (handles rental creation)

* Permissions: Send Messages, Embed Links, Manage Messages

[Rent Management Bot](https://discord.com/oauth2/authorize?client_id=962776329546248252) (handles IP updates)

* Permissions: Send Messages, Embed Links
{% endstep %}

{% step %}
**Post Interface**

Run this command in your rental channel to post the rental interface:

```bash
!setup-rental
```

Pin the posted message so users can easily find the rental interface.
{% endstep %}

{% step %}
**Test**

* Click "Rent" → select location → submit test transaction
* DM Rent Management Bot: `!start` → verify dashboard works
* Confirm with Thor Labs that test rental has your guild\_id
{% endstep %}

{% step %}
**Go Live**

* Announce to your community
* Monitor first rentals
* Provide user support as needed
{% endstep %}
{% endstepper %}
