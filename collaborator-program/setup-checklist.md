# Setup Checklist

## Pre-Setup

* [ ] Contact Thor Labs (provide guild\_id, server name, contact)
* [ ] Agree on revenue share %
* [ ] Create rental channel
* [ ] Get bot invite links from Thor Labs

## Setup Day

{% stepper %}
{% step %}
**Bots**

* [ ] Invite [ThorRent Bot](https://discord.com/oauth2/authorize?client_id=1163557139911024772) (permissions: Send Messages, Embed Links, Manage Messages)
* [ ] Invite [Rent Management Bot](https://discord.com/oauth2/authorize?client_id=962776329546248252) (permissions: Send Messages, Embed Links)
* [ ] Verify both bots are online
{% endstep %}

{% step %}
**Launch**

* [ ] Run the setup command in the rental channel:

```
!setup-rental
```

* [ ] Verify the interface posts with buttons
* [ ] Pin the message
* [ ] Receive confirmation DM
{% endstep %}

{% step %}
**Test**

* [ ] Test rental: Click "Rent" → select location → submit test TX
* [ ] Test management: DM bot: `@Renter Dashboard #4468`

```
!start
```

→ verify dashboard

* [ ] Confirm test rental has your guild\_id (ask Thor Labs)
{% endstep %}

{% step %}
**Go Live**

* [ ] Delete and get a refund for test rental
* [ ] Announce to community
* [ ] Monitor first rental
{% endstep %}
{% endstepper %}

## Ongoing

* [ ] Anytime: Check stats with:

```
!revenue-stats
```

* [ ] Monthly: Review revenue report
* [ ] As needed: Run `!setup-rental` if interface deleted
* [ ] Support: Help users with general questions. Forward them to Thor Labs for detailed support.

## Troubleshooting

<details>

<summary>Interface won't post?</summary>

Check bot permissions and verify the bot is online.

</details>

<details>

<summary>Buttons don't work?</summary>

Ask user to restart Discord and try again.

</details>

<details>

<summary>Rental fails?</summary>

Check the amount, wallet, and ensure the TX is not reused.

</details>

<details>

<summary>Bot not responding?</summary>

Users should DM the Rent Management Bot (do not send the command in a server channel).

</details>

## Quick Reference

```
!setup-rental
```

(Admin only, posts interface)

```
!revenue-stats
```

(Admin only, shows stats)

***

✅ Check off items as completed
