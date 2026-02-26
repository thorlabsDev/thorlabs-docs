---
description: >-
  Private RPC users prefer to run their software (bots or sniping tools) in a
  virtual server which has low latency to the RPC node.
---

# AWS EC2 (VPS) Setup

## Why Do I Need a VPS/VM/Server?

You need a fast internet connection and low ping to utilize your software which use private Solana RPCs. Most users do not have low pings to the RPC nodes and have slow internet connection so they prefer using servers in datacenters.

## Why AWS?

AWS has one of the best network routing and they have a variety of server configurations which is what we want for optimal performance. Also pay to go option is quite good for beginners.

### 1. EC2 Setup

* Go to [https://us-east-1.console.aws.amazon.com/ec2/v2/home?region=us-east-1#LaunchInstances:](https://us-east-1.console.aws.amazon.com/ec2/v2/home?region=us-east-1#LaunchInstances:)
* Name your server and select OS as given below. Also create a new administrator key as .pem

![](https://2207041657-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FAWUMKqE6lUPprI84aqd8%2Fuploads%2Fgit-blob-28de0f26d4e9aada2f9cf7699b7d2f7d2559a52e%2Fimage.png?alt=media)

* Scroll down and select an instance type.

![](https://2207041657-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FAWUMKqE6lUPprI84aqd8%2Fuploads%2Fgit-blob-0894dc5eaa0c6b0bfe7d86cc16488e88803387de%2Fimage.png?alt=media)

{% hint style="info" %}
_Minimum 16 vCPU and 32GB ram with 1 GB bandwith is suggested. You may prefer c5a.4xlarge or c5a.8xlarge depending on your budget._
{% endhint %}

* Change nothing in Network Settings and Configure Store and click "Launch Instance"

### 2. Run your VPS

* Now your VPS is ready to run. Remote Desktop application is used to connect your VPS desktop. You will use Public IPv4 addresses to connect your remote desktop.

![](https://2207041657-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FAWUMKqE6lUPprI84aqd8%2Fuploads%2Fgit-blob-7efacf4f36148cfcafe35ef8b8afa5a28665bdc1%2Fimage.png?alt=media)

* Before connection, you need administrator password. Right click on your VPS and:\
  ![](https://2207041657-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FAWUMKqE6lUPprI84aqd8%2Fuploads%2Fgit-blob-da792d3f3d58902eceec8f61d5df563b7e09c351%2Fimage.png?alt=media)
* A new window will pop-up. Browse your .pem key file and decrypt the hash. Now you have your administrator password. You will need it when you login your EC2 instance.

![](https://2207041657-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FAWUMKqE6lUPprI84aqd8%2Fuploads%2Fgit-blob-a249539c4f26612641272c23db7f9450e4499670%2Fimage.png?alt=media)

### 3. Connect

* Run Remote Desktop software and "add PC" not workspace. A pop-up will show up and enter your credentials:\
  PC Name: Your Public IPv4 Address\
  User Account: "Add user account" for first usage and faster connection.
* ![](https://2207041657-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FAWUMKqE6lUPprI84aqd8%2Fuploads%2Fgit-blob-e5d86ff61c980e53bd8608859c7f050c46e10cdf%2Fimage.png?alt=media)
* Add and connect.\
  \
  Congratulations. You successfully deployed your AWS EC2 Instance aka AWS VPS.

### 4. Elastic IP Allocation

* To have a static IP, go to\
  Network & Security -> Elastic IPs -> Allocate Elastic IP
* Change nothing and click "Allocate"

![](https://2207041657-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FAWUMKqE6lUPprI84aqd8%2Fuploads%2Fgit-blob-6fd41e3645e060f9e7e0ba5ac416dd7434718251%2Fimage.png?alt=media)

* A new window will show up. Click actions and select:

![](https://2207041657-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FAWUMKqE6lUPprI84aqd8%2Fuploads%2Fgit-blob-1f996783461dd689fdbf3088165090c050198527%2Fimage.png?alt=media)

* Now a new window will show up to select the instance to be allocated:\
  ![](https://2207041657-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FAWUMKqE6lUPprI84aqd8%2Fuploads%2Fgit-blob-07f29c8a975fe345a15f1b01220bf054b7d5583d%2Fimage.png?alt=media)
* Select your newly created instance and Associate.

Congratulations, now you have got your static IP. Your IP address will not be changed until you release the Elastic IP.
