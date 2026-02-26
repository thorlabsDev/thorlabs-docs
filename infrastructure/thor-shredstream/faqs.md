# FAQs

## Frequently Asked Questions

<details>

<summary>Do I need to handle packet loss?</summary>

Yes, UDP does not guarantee delivery. For critical applications, implement FEC (Forward Error Correction) decoding using coding shreds, or accept occasional gaps.

</details>

<details>

<summary>Can I receive shreds behind NAT?</summary>

No. You need a public IP with a directly accessible UDP port. Home connections with CGNAT will not work.

</details>

<details>

<summary>What's the difference between data and coding shreds?</summary>

* **Data shreds** (type=0) contain actual transaction data
* **Coding shreds** (type=1) are for FEC - used to recover lost data shreds

</details>

<details>

<summary>How do I reconstruct transactions?</summary>

Collect all data shreds for a slot, sort by index, concatenate payloads, and parse the resulting entries. This requires understanding Solana's entry and transaction formats.

</details>

<details>

<summary>What locations are available?</summary>

Shred sources deployed in regions with highest validator and stake density. Contact us for availability.

</details>

## Support

For access requests and technical support, contact [Thor Labs](https://discord.gg/thor_labs).
