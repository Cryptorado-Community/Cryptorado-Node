# CORE-Node
## Community Resource Node Software Development
---
### Development Group Chat: https://discord.gg/pP8UEdF
### Overview of Project's Mission: https://decentralizedsummit.com/agenda/dan-shields-ethdenver/
---
## Goal:
A plug-and-play set of services that anyone can easily install/deploy that connects with a set of peer nodes in a community swarm, all hosting a set of common resources. The node's components will be structured to have a simple common interface to plug-in any application/feature (OPTIONALLY) a community desires, like:
- A Website
- A Bulletin Board
- Community Member Profiles
- A Federated Chat Server&Client
- A Forum
- A Wiki
- Shared Files
- ... and more!
---
# Key Node Components

## IPFS:

Possible contender for the core database: [Orbit DB](https://github.com/orbitdb/orbit-db)

### Shared Data Base:

We will host all shared data via IPFS and use [pubsub](https://github.com/ipfs/go-ipfs/blob/master/core/commands/pubsub.go#L23) and swarm to

### Self-Sovereign User/Profile Management

Via IPNS (TODO FILL OUT IDEA FOR SERVERLESS USER MANAGMENT)


## Matrix:

### Chat

## Levels of Nodes

The level of requirements for running a node will start with only a browser permission, then up to a simple browser extention, and finally at a dedicated instalation that runs as long as a hosting device is on. We create incentives based on the reourceses used to host these nodes based on what you are able to access for community applications/plug-ins to the node.  

### In Browser Only

As a minimum, a temporary node can be instantiated in browser only for as long as a user is actively accessing the communities resources via [js-ipfs](https://github.com/ipfs/js-ipfs)

This level of support would only afford (optionally) minimal prfiles/accounts on the community resources.

### Browser Extension

If a user wants to run something in a more dedicated way - whenever they have a browser open, along with ability to have more personal connection and persistent storage of data via the  community node network. this would also open up more resources dedicated to hosting reources for the community at large.

Browser Extension for IPFS: [ipfs-companion](https://github.com/ipfs-shipyard/ipfs-companion)


### Mobile App

(OPTIONAL) If we use a framework with PWA ability, we can publish a dedicated app that would be running in the background on devices as long as they are online to help support the network.

### Deploy-able / Dedicated Installation


## Further plug-in Integration:

### Wiki
[PeerPad](https://github.com/ipfs-shipyard/peer-pad)
