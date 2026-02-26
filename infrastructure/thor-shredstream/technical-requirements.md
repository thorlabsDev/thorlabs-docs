# Technical Requirements

To use Shred Stream effectively, you need:

### Infrastructure

* **Public IP** with open UDP port (no NAT/CGNAT)
* **Low-latency server** close to Thor Labs RPC Nodes (recommended: Frankfurt)
* **Sufficient bandwidth** (\~50-100 Mbps for full shred stream)

### Development Capability

* **Deshredding logic** to reconstruct transactions from shred fragments
* **FEC decoding** (optional) to recover from packet loss
* **Custom parsing** for your specific use case

### Example Client (Go)

{% code title="shred_listener.go" %}
```go
package main

import (
    "encoding/binary"
    "fmt"
    "net"
)

// Solana shred header offsets (per spec)
const (
    OffsetVariant = 64 // 0x40: Shred variant (1 byte)
    OffsetSlot    = 65 // 0x41: Slot number (8 bytes, u64 LE)
    OffsetIndex   = 73 // 0x49: Shred index (4 bytes, u32 LE)
)

func main() {
    addr, _ := net.ResolveUDPAddr("udp", ":9000")
    conn, _ := net.ListenUDP("udp", addr)
    defer conn.Close()

    buf := make([]byte, 1232)

    for {
        n, _, err := conn.ReadFromUDP(buf)
        if err != nil {
            continue
        }

        shred := buf[:n]
        variant := shred[OffsetVariant]
        slot := binary.LittleEndian.Uint64(shred[OffsetSlot : OffsetSlot+8])
        index := binary.LittleEndian.Uint32(shred[OffsetIndex : OffsetIndex+4])

        fmt.Printf("slot=%d index=%d variant=0x%02x size=%d\n",
            slot, index, variant, n)
    }
}
```
{% endcode %}

{% hint style="info" %}
This example listens on UDP port 9000 and parses the variant, slot, and index fields from each received shred according to the Solana shred header offsets.
{% endhint %}

### Shred Format

Per the [Solana shred specification](https://github.com/solana-foundation/specs/blob/main/p2p/shred.md):

| Offset | Size   | Field                                |
| ------ | ------ | ------------------------------------ |
| 0x00   | 64     | Signature (Ed25519)                  |
| 0x40   | 1      | Variant (encodes type + auth method) |
| 0x41   | 8      | Slot (u64 little endian)             |
| 0x49   | 4      | Index (u32 little endian)            |
| 0x4D   | 2      | Version (u16 little endian)          |
| 0x4F   | 4      | FEC Set Index (u32 little endian)    |
| 0x53+  | varies | Type-specific header + payload       |

The **variant** byte encodes both the shred type (data/coding) and authentication method (legacy/merkle) as two 4-bit values.

{% hint style="warning" %}
Maximum shred size: 1228 bytes (fits in a single UDP packet). Ensure your UDP buffer and networking configuration can handle this size and the expected throughput (\~50–100 Mbps).
{% endhint %}
