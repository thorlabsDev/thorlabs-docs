# Typescript

TypeScript/Node.js client for ThorStreamer using gRPC-js.

## Installation

{% code title="Install dependencies" %}
```bash
npm install @grpc/grpc-js google-protobuf
```
{% endcode %}

## Proto Generation

{% stepper %}
{% step %}
**Clone repository**

```bash
# Clone the repository
git clone https://github.com/thorlabsDev/ThorStreamer.git
cd ThorStreamer/examples/typescript
```
{% endstep %}

{% step %}
**Install dependencies**

```bash
# Install dependencies
npm install
```
{% endstep %}

{% step %}
**Generate proto files**

```bash
# Generate proto files
npm run proto:gen
npm run proto:ts
```
{% endstep %}
{% endstepper %}

## Quick Start

{% code title="Quick start example" %}
```typescript
import * as grpc from '@grpc/grpc-js';
import { Empty } from 'google-protobuf/google/protobuf/empty_pb';
import { EventPublisherClient } from './proto/publisher_grpc_pb';
import { StreamResponse } from './proto/publisher_pb';

const client = new EventPublisherClient(
    process.env.SERVER_ADDRESS!,
    grpc.credentials.createInsecure()
);

const metadata = new grpc.Metadata();
metadata.set('authorization', process.env.AUTH_TOKEN!);

const stream = client.subscribeToTransactions(new Empty(), metadata);

stream.on('data', (response: StreamResponse) => {
    console.log('Transaction:', response.getData().length, 'bytes');
});

stream.on('error', (err) => {
    console.error('Stream error:', err);
});

stream.on('end', () => {
    console.log('Stream ended');
});
```
{% endcode %}

## API Reference

### Creating a Client

{% code title="Create a client" %}
```typescript
import * as grpc from '@grpc/grpc-js';
import { EventPublisherClient } from './proto/publisher_grpc_pb';

const client = new EventPublisherClient(
    'your-server:50051',
    grpc.credentials.createInsecure()
);

const metadata = new grpc.Metadata();
metadata.set('authorization', 'your-token');
```
{% endcode %}

### subscribeToTransactions

{% code title="Subscribe to transactions" %}
```typescript
import { Empty } from 'google-protobuf/google/protobuf/empty_pb';

const stream = client.subscribeToTransactions(new Empty(), metadata);

stream.on('data', (response: StreamResponse) => {
    const data = response.getData_asU8();
    // Deserialize transaction data
    console.log('Transaction received:', data.length, 'bytes');
});
```
{% endcode %}

### subscribeToSlotStatus

{% code title="Subscribe to slot status" %}
```typescript
const stream = client.subscribeToSlotStatus(new Empty(), metadata);

stream.on('data', (response: StreamResponse) => {
    const data = response.getData_asU8();
    // Deserialize slot status
    console.log('Slot update:', data.length, 'bytes');
});
```
{% endcode %}

### subscribeToWalletTransactions

Monitor up to 10 wallet addresses:

{% code title="Subscribe to wallet transactions" %}
```typescript
import { SubscribeWalletRequest } from './proto/publisher_pb';

const request = new SubscribeWalletRequest();
request.setWalletAddressList([
    '9WzDXwBbmkg8ZTbNMqUxvQRAyrZzDsGYdLVL9zYtAWWM',
    '2ojv9BAiHUrvsm9gxDe7fJSzbNZSJcxZvf8dqmWGHG8S',
]);

const stream = client.subscribeToWalletTransactions(request, metadata);

stream.on('data', (response: StreamResponse) => {
    console.log('Wallet transaction received');
});
```
{% endcode %}

### subscribeToAccountUpdates

Monitor accounts with optional owner filtering:

{% code title="Subscribe to account updates" %}
```typescript
import { SubscribeAccountsRequest } from './proto/publisher_pb';

const request = new SubscribeAccountsRequest();
request.setAccountAddressList(['account1...', 'account2...']);
request.setOwnerAddressList(['TokenkegQfeZyiNwAJbNbGKPFXCWuBvf9Ss623VQ5DA']);

const stream = client.subscribeToAccountUpdates(request, metadata);

stream.on('data', (response: StreamResponse) => {
    console.log('Account update received');
});
```
{% endcode %}

## Error Handling

{% code title="Stream error handling" %}
```typescript
stream.on('error', (err: grpc.ServiceError) => {
    console.error('Error code:', err.code);
    console.error('Error message:', err.message);

    // Implement reconnection logic
    if (err.code === grpc.status.UNAVAILABLE) {
        // Server unavailable, retry with backoff
    }
});

stream.on('end', () => {
    console.log('Stream ended normally');
});
```
{% endcode %}

## Promise Wrapper

Wrap streams in Promises for async/await usage:

{% code title="Promise wrapper for stream" %}
```typescript
async function subscribeTransactions(): Promise<void> {
    return new Promise((resolve, reject) => {
        const stream = client.subscribeToTransactions(new Empty(), metadata);

        stream.on('data', (response: StreamResponse) => {
            processTransaction(response.getData_asU8());
        });

        stream.on('error', reject);
        stream.on('end', resolve);
    });
}

// Usage
try {
    await subscribeTransactions();
} catch (err) {
    console.error('Stream failed:', err);
}
```
{% endcode %}

## Full Example

See the complete implementation with proto generation scripts in the repository:

* https://github.com/thorlabsDev/ThorStreamer/tree/master/examples/typescript

## Build Scripts

Package.json scripts (descriptions shown in place of generator commands):

{% code title="package.json - scripts" %}
```json
{
  "scripts": {
    "proto:gen": "Generate JavaScript from protos",
    "proto:ts": "Generate TypeScript definitions",
    "proto:clean": "Remove generated files",
    "build": "tsc",
    "start": "node dist/client.js",
    "dev": "ts-node src/client.ts"
  }
}
```
{% endcode %}

## Resources

* [GitHub Repository](https://github.com/thorlabsDev/ThorStreamer)
* [gRPC for Node.js](https://www.npmjs.com/package/@grpc/grpc-js)
