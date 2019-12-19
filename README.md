# Cryptorado-Node

---
### Development Group Chat: https://keybase.io/team/cryptorado (ask `nukemandan` for the webdev subteam invite)
### Overview of Project's Mission: https://decentralizedsummit.com/agenda/dan-shields-ethdenver/
---

This repository contains the docker environment necessary to help co-host the
Cryptorado website via IPFS and IPFS-cluster.

# Requirements

Any linux environment with internet access, capable of running docker and
docker-compose.

In most cases it is not necessary to perform any network configuration,
including opening ports on NATs, in order for this to work.

# Running a Node

## Setup

The following steps will guide you from zero to having a fully functioning
Cryptorado-Node instance.

1) Tell a Cryptorado admin that you would like to be a part of the cluster. Find
us on [keybase][kb]!

  They will likely ask you some questions, and if all goes well give you a file
  ending in `.tgz`.

  Back up this file in a secure place ([kbfs](https://keybase.io/docs/kbfs)
  works), and don't give it to anyone!

2) Clone this repo onto your machine.

3) Copy the `.tgz` file you were given into the repo's directory, then extract
it there:

  ```
  cp my-secret-file.tgz Cryptorado-Node
  cd Cryptorado-Node
  tar xzf my-secret-file.tgz .
  ```

4) Start up the node by performing `docker-compose up -d`. Docker must already
be started for this to work.

5) Check that you've successfully connected to the cluster and have synced the
pinset.

  `./cmd.sh ls-peers` will list out all peers you've connected to. The top
  line should say `Sees N other peers`, where N>0.

  `./cmd.sh ls-pins` will list out all CIDs in the pinset. There should be at
  least one.

If you're having trouble with any of these steps, head over to the
`#distributed-web` channel in the [keybase team][kb] and someone will hopefully
be able to help.

## Stopping the Node

To stop a running node you can navigate to the Cryptorado-Node directory and
perform `docker-compose down`. If you'd like to completely reset your node you
can then delete the whole directory and start over. Be sure not to lose your
secret `.tgz` file!

# How Does It Work?

There are three components being run in the docker environment:

- An [ipfs](https://ipfs.io/) node, which actually retrieves and hosts the
  pinned files and makes them available to the other nodes in the cluster.

- An [ipfs-cluster](https://cluster.ipfs.io/) node, which communicates with all
  other cryptorado nodes. All the nodes work together to achieve a concesus on
  what the current set of pinned files is.

- A [nebula](https://github.com/slackhq/nebula) process which creates the
  private network over which all communication between nodes happens. nebula
  creates encrypted, direct p2p links between nodes, and also handles NAT
  punching in many cases.

If you have specific questions on how this project works, feel free to ask
in the `#distributed-web` channel in the [keybase team][kb].

[kb]: https://keybase.io/team/cryptorado
