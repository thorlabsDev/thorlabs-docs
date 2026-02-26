# Getting Started

{% stepper %}
{% step %}
**Request Access**

Get your access with the [Dashboard bot](../../introduction/node-locations-and-access/authentication/managing-authentications/authenticate-your-ip) in the [Thor Labs Discord Server](https://discord.gg/thorlabs). You'll need to provide:

* Server IP address
* Preferred UDP port
{% endstep %}

{% step %}
**Receive Credentials**

Once the bot approves, you'll receive confirmation that your IP:port is registered.
{% endstep %}

{% step %}
**Start Receiving**

Run your UDP listener on the registered port. Shreds will begin flowing immediately.
{% endstep %}

{% step %}
**Monitor Health**

Check that you're receiving shreds:

{% code title="Monitor packets (example)" %}
```bash
# Count packets per second
tcpdump -i eth0 udp port 9000 2>/dev/null | pv -l -i 5 > /dev/null
```
{% endcode %}

Expected: 3,000-10,000 shreds/second depending on network activity.
{% endstep %}
{% endstepper %}

## Data Characteristics

| Metric            | Typical Value                                   |
| ----------------- | ----------------------------------------------- |
| Shreds per second | 3,000 - 10,000                                  |
| Shred size        | 800 - 1,228 bytes                               |
| Bandwidth         | 30 - 100 Mbps                                   |
| Latency advantage | <p>200 - 400ms vs RPC<br>100-200 ms vs gRPC</p> |

## Next Steps

* [Choose Your Data Source](choose-your-data-source) — Explore all available data sources
* [FAQs](faqs) — Frequently Asked Questions
