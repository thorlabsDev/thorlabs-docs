# Node Locations and Access

All RPC node locations are subject to change depending on the usage and user request. New locations may be added and the current ones may be moved to another location.

{% hint style="info" %}
💡 Virginia Node is sponsored by **Zesty Solutions**. Buy a 30% discounted VPS from Zesty Store using **TN30GB** coupon code.
{% endhint %}

## Solana

<table><thead><tr><th>Location</th><th width="230.34375">URL</th><th width="220.96484375">WebSocket</th><th width="185.8828125">gRPC</th><th width="102.953125">RPS/TPS</th><th width="112.07421875">Availability</th><th>Bifrost</th></tr></thead><tbody><tr><td>Amsterdam, NL</td><td>http://rpc-ams.thornode.io/</td><td>ws://rpc-ams.thornode.io/</td><td>64.130.43.86:50051</td><td>400/200</td><td>All pass types</td><td>http://bifrost-ams.thornode.io/</td></tr><tr><td>Frankfurt, DE</td><td>http://rpc-de.thornode.io/</td><td>ws://rpc-de.thornode.io/</td><td>45.134.108.228:50051</td><td>400/200</td><td>All pass types</td><td>http://bifrost-de.thornode.io/</td></tr><tr><td>Frankfurt, DE (Elite Only)</td><td>http://rpc-elite-fr-27a519d7.thornode.io/</td><td>ws://rpc-elite-fr-27a519d7.thornode.io/</td><td>45.134.108.228:50051</td><td>600/300</td><td>Elite pass only</td><td>http://bifrost-de-elite.thornode.io/</td></tr><tr><td>London, UK</td><td>http://rpc-eu-west-2.thornode.io/</td><td>ws://rpc-eu-west-2.thornode.io/</td><td>64.130.63.7:50051</td><td>400/200</td><td>Flash Node Pass</td><td>http://bifrost-uk.thornode.io/</td></tr><tr><td>Los Angeles, USA</td><td>http://rpc-lax.thornode.io/</td><td>ws://rpc-lax.thornode.io/</td><td>64.130.58.190:50051</td><td>400/200</td><td>Flash Node Pass</td><td>http://bifrost-lax.thornode.io/</td></tr><tr><td>New York, USA</td><td>http://rpc-ny.thornode.io/</td><td>ws://rpc-ny.thornode.io/</td><td>64.130.37.200:50051</td><td>400/200</td><td>All pass types</td><td>http://bifrost-ny.thornode.io/</td></tr><tr><td>Salt Lake City, USA</td><td>http://rpc-slc1.thornode.io/</td><td>ws://rpc-slc1.thornode.io/</td><td>64.130.33.158:50051</td><td>600/300</td><td>All pass types</td><td>-</td></tr><tr><td>Tokyo, JP</td><td>http://ap-northeast-1.thornode.io/</td><td>ws://ap-northeast-1.thornode.io/</td><td>208.91.107.18:50051</td><td>600/300</td><td>All pass types</td><td>http://bifrost-jp.thornode.io/</td></tr><tr><td>Virginia, USA</td><td>http://rpc-va-zesty.thornode.io/</td><td>ws://rpc-va-zesty.thornode.io/</td><td>64.130.37.200:50051</td><td>400/200</td><td>All pass types</td><td>-</td></tr></tbody></table>

### Bifrost Services

| Location          | Services                              | Bifrost TPS |
| ----------------- | ------------------------------------- | ----------- |
| Amsterdam         | bloXroute, Astralane, BlockRazor      | 30          |
| Frankfurt         | bloXroute, Astralane, BlockRazor      | 30          |
| Frankfurt (Elite) | bloXroute, Astralane, BlockRazor      | 50          |
| London            | bloXroute, Astralane                  | 30          |
| Los Angeles       | bloXroute, Astralane, BlockRazor (NY) | 30          |
| New York          | bloXroute, Astralane, BlockRazor      | 30          |
| Tokyo             | bloXroute, Astralane, BlockRazor      | 30          |

***

## Binance Smart Chain

| Location      | URL                        | WebSocket                | RPS/TPS | Availability   |
| ------------- | -------------------------- | ------------------------ | ------- | -------------- |
| Frankfurt, DE | http://bsc-de.thornode.io/ | ws://bsc-de.thornode.io/ | 300     | All pass types |

***

## Ethereum (Temporarily Unavailable)

| Location      | URL                               | Availability   |
| ------------- | --------------------------------- | -------------- |
| Virginia, USA | https://rpc-ethereum.thornode.io/ | All pass types |

***

## Polygon (Temporarily Unavailable)

| Location      | URL                                  | Availability   |
| ------------- | ------------------------------------ | -------------- |
| Virginia, USA | https://rpc-polygon-pos.thornode.io/ | All pass types |

***

{% hint style="info" %}
All endpoints support SSL connections:

* Replace `http://` with `https://`
* Replace `ws://` with `wss://`
{% endhint %}

{% hint style="warning" %}
⚠️ Note: Web applications require HTTPS endpoints.
{% endhint %}

***

## Pass Differences

| Pass Type | IP Limit per Pass | Access                             | Notes                                                                   |
| --------- | ----------------- | ---------------------------------- | ----------------------------------------------------------------------- |
| Flash     | 1                 | Shared RPCs at available locations | Standard limits                                                         |
| Classic   | 4                 | Shared RPCs at available locations | Standard limits                                                         |
| Elite     | 4 + 1             | Shared + Elite-only endpoints      | 600 RPS / 300 TPS, 50 Bifrost TPS                                       |
| Prime     | 4 + Unlimited     | Shared + Dedicated RPC option      | Standalone servers, higher RPS. Contact Prime Pass holders for details. |
