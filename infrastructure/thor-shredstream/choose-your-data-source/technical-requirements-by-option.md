# Technical Requirements by Option

### ShredStream

* Public IP with open UDP port
* Low-latency server (Frankfurt recommended)
* 50-100 Mbps bandwidth
* Custom deshredding implementation
* FEC decoding (optional, for packet loss recovery)

### Geyser gRPC

* gRPC client library
* Stable TCP connection
* Protobuf parsing
* Subscription management logic

### RPC

* HTTP client
* JSON parsing
* Basic error handling

## Cost Considerations

| Option      | Infrastructure | Development           | Operational                |
| ----------- | -------------- | --------------------- | -------------------------- |
| ShredStream | High           | High (custom parsing) | Medium                     |
| Geyser gRPC | Medium         | Medium                | Medium                     |
| RPC         | Low            | Low                   | Low (may have rate limits) |

{% hint style="info" %}
Summary:

* ShredStream is for teams who need every millisecond of advantage and have the technical capability to handle raw shreds. It's the fastest but most complex option.
* Geyser gRPC is the sweet spot for most real-time applications. You get low latency with parsed data and reliable delivery.
* RPC is the standard choice for applications where latency isn't critical. It's simple, reliable, and widely supported.

Choose based on your latency requirements and technical capabilities. When in doubt, start with gRPC or RPC and move to Shred Stream only if you need the extra edge.
{% endhint %}
