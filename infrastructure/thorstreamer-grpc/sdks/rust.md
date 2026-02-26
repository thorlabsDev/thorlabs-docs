# Rust

Official Rust client library for ThorStreamer with async/await support.

## Installation

Add to `Cargo.toml`:

{% code title="Cargo.toml" %}
```toml
[dependencies]
thorstreamer-grpc-client = "0.1"
tokio = { version = "1", features = ["full"] }
```
{% endcode %}

## Quick Start

{% code title="main.rs" %}
```rust
use thorstreamer_grpc_client::{ClientConfig, ThorClient, parse_message};
use thorstreamer_grpc_client::proto::thor_streamer::types::message_wrapper::EventMessage;

#[tokio::main]
async fn main() -> Result<(), Box<dyn std::error::Error>> {
    let config = ClientConfig {
        server_addr: "http://your-server:50051".to_string(),
        token: "your-token".to_string(),
        ..Default::default()
    };

    let mut client = ThorClient::new(config).await?;
    let mut stream = client.subscribe_to_transactions().await?;

    while let Some(response) = stream.message().await? {
        let msg = parse_message(&response.data)?;
        if let Some(EventMessage::Transaction(tx_wrapper)) = msg.event_message {
            if let Some(tx) = tx_wrapper.transaction {
                println!("Transaction: slot={}", tx.slot);
            }
        }
    }
    Ok(())
}
```
{% endcode %}

## API Reference

### Creating a Client

{% code title="create_client.rs" %}
```rust
use thorstreamer_grpc_client::{ClientConfig, ThorClient};
use std::time::Duration;

let config = ClientConfig {
    server_addr: "http://server:50051".to_string(),
    token: "your-token".to_string(),
    timeout: Duration::from_secs(30),
};

let client = ThorClient::new(config).await?;
```
{% endcode %}

### subscribe\_to\_transactions

{% code title="subscribe_to_transactions.rs" %}
```rust
use thorstreamer_grpc_client::proto::thor_streamer::types::message_wrapper::EventMessage;

let mut stream = client.subscribe_to_transactions().await?;

while let Some(response) = stream.message().await? {
    let msg = parse_message(&response.data)?;
    if let Some(EventMessage::Transaction(tx_wrapper)) = msg.event_message {
        if let Some(tx) = tx_wrapper.transaction {
            let sig_hex: String = tx.signature.iter()
                .take(8)
                .map(|b| format!("{:02x}", b))
                .collect();
            println!("Transaction: slot={}, sig={}", tx.slot, sig_hex);
        }
    }
}
```
{% endcode %}

### subscribe\_to\_slot\_status

{% code title="subscribe_to_slot_status.rs" %}
```rust
let mut stream = client.subscribe_to_slot_status().await?;

while let Some(response) = stream.message().await? {
    let msg = parse_message(&response.data)?;
    if let Some(EventMessage::Slot(slot)) = msg.event_message {
        println!("Slot: {}, status={}, height={}",
            slot.slot, slot.status, slot.block_height);
    }
}
```
{% endcode %}

### subscribe\_to\_wallet\_transactions

Monitor up to 10 wallet addresses:

{% code title="subscribe_to_wallet_transactions.rs" %}
```rust
let wallets = vec![
    "9WzDXwBbmkg8ZTbNMqUxvQRAyrZzDsGYdLVL9zYtAWWM".to_string(),
    "2ojv9BAiHUrvsm9gxDe7fJSzbNZSJcxZvf8dqmWGHG8S".to_string(),
];

let mut stream = client.subscribe_to_wallet_transactions(wallets).await?;

while let Some(response) = stream.message().await? {
    let msg = parse_message(&response.data)?;
    if let Some(EventMessage::Transaction(tx_wrapper)) = msg.event_message {
        println!("Wallet transaction received");
    }
}
```
{% endcode %}

### subscribe\_to\_account\_updates

Monitor accounts with optional owner filtering:

{% code title="subscribe_to_account_updates.rs" %}
```rust
let accounts = vec!["account1...".to_string()];
let owners = vec!["TokenkegQfeZyiNwAJbNbGKPFXCWuBvf9Ss623VQ5DA".to_string()];

let mut stream = client.subscribe_to_account_updates(accounts, owners).await?;

while let Some(response) = stream.message().await? {
    let msg = parse_message(&response.data)?;
    if let Some(EventMessage::AccountUpdate(update)) = msg.event_message {
        println!("Account: lamports={}", update.lamports);
    }
}
```
{% endcode %}

## Error Handling

{% code title="error_handling.rs" %}
```rust
use tonic::Status;

match stream.message().await {
    Ok(Some(response)) => {
        // Process message
    }
    Ok(None) => {
        // Stream ended normally
        println!("Stream closed");
    }
    Err(status) => {
        // Handle gRPC error
        eprintln!("Stream error: {:?}", status);
    }
}
```
{% endcode %}

## Environment Variables

Using `dotenv`:

{% code title="Cargo.toml (dotenv)" %}
```toml
[dependencies]
dotenv = "0.15"
```
{% endcode %}

{% code title="dotenv_usage.rs" %}
```rust
use dotenv::dotenv;

dotenv().ok();
let config = ClientConfig {
    server_addr: std::env::var("SERVER_ADDRESS")?,
    token: std::env::var("AUTH_TOKEN")?,
    ..Default::default()
};
```
{% endcode %}

## Full Example

See the complete implementation in the examples directory:\
[https://github.com/thorlabsDev/ThorStreamer/tree/master/examples/rust](https://github.com/thorlabsDev/ThorStreamer/tree/master/examples/rust)

## Resources

* [thorstreamer-grpc-client](https://crates.io/crates/thorstreamer-grpc-client)
* [Documentation](https://docs.rs/thorstreamer-grpc-client)
* [GitHub Repository](https://github.com/thorlabsDev/ThorStreamer)
