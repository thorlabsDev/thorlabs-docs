# Quick Start

{% stepper %}
{% step %}
**Verify your wallet**

Connect your wallet holding the Node Pass in the Thor Labs Discord verification channel.\
[https://verify-beta.thornode.io/](https://verify-beta.thornode.io/)
{% endstep %}

{% step %}
**Open a DM**

Send a direct message to the Auth Bot.
{% endstep %}

{% step %}
**Run the command**

Type the command below in the DM to begin authentication:

```
!rpc auth
```
{% endstep %}

{% step %}
**Follow the prompts**

Select your pass, choose a location, and enter your IP address when prompted by the bot.
{% endstep %}
{% endstepper %}

## Documentation Sections

* [Thor Pass Authentication](../node-locations-and-access/authentication/managing-authentications) - Guide for Classic, Elite, and Gold pass holders
* [Flash Pass Authentication](flash-node-passes) - Guide for Flash pass holders
* [Prime Pass Authentication](../node-locations-and-access/authentication/prime-pass-authentication) - Guide for Prime pass holders
* [Rental System Guide](../node-locations-and-access/rental-system) - How to rent and manage rented slots
* [Managing Your Authentication](../node-locations-and-access/authentication/managing-authentications) - Update, delete, and manage your IPs
* [Troubleshooting & FAQ](../node-locations-and-access/troubleshooting) - Common issues and solutions

## Available Commands

All commands are run in **Direct Messages** with the Auth Bot:

| Command       | Description                              |
| ------------- | ---------------------------------------- |
| `!rpc auth`   | Authenticate a new IP address            |
| `!rpc delete` | View and manage existing authentications |
| `!rpc remark` | Add notes to your authentications        |
| `!rpc rents`  | View your active rentals (pass holders)  |
| `!rpc token`  | View your gRPC tokens                    |
| `!rpc help`   | Display help information                 |

{% hint style="info" %}
Need Help?

* Check the [Troubleshooting](../node-locations-and-access/troubleshooting) page
* Contact Thor Labs support in the Discord server
* Report bugs with the error code displayed (e.g., Dx70, Rx306)
{% endhint %}
