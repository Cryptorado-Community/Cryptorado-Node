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

The Cryptorado-Node docker containers will continue running until they are
stopped. If the host is restarted the containers should automatically start
themselves on boot (as long as docker is set to start on boot).

If you're having trouble with any of these steps, head over to the
`#distributed-web` channel in the [keybase team][kb] and someone will hopefully
be able to help.

## Updating the Node

Occasionally this repo will be updated with configuration changes. In order to
apply these changes, simply pull down the changes and restart the containers:

```
git pull
docker-compose restart
```

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

# Admin

This section is meant for admins who will be adding new members to the cluster,
pinning new content, or otherwise doing more than simply joining the cluster.

## Adding New Members

In order to add new members to the cluster you must have the nebula root cert
key saved at `config/ca.key`. You can get this file from an existing admin. KEEP
THIS FILE SECRET.

Once you have the key, adding a new member is fairly easy. Simply run `./cmd.sh
new-host` and follow the prompts. Once done, the following will have been
accomplished.

* A `.tgz` file will have been created for the new member, which should be given
  to them. DO NOT COMMIT THIS FILE. Once certain they've received the file and
  are set up, you should delete your copy. This file contains the new member's
  certificate for connecting to the nebula network, as well as the ipfs-cluster
  secret.

* The `nebula_hosts.txt` file will have been modified with a new entry for the
  new member. The change to this file _should_ be committed and pushed, as it
  allows us to track what IPs have been assigned to which machines.

## Pinning Files

### The Easy Way

Run `./cmd.sh pin path/to/some/file/or/directory`.

### The Hard Way

Once the Cryptorado-Node is running, it mounts the directory at
`./ipfs_data/export` into the `ipfs-cluster` container at `/export`. So in order
to pin some content it must be copied into that directory. Once done, you can
do:

```
docker-compose exec ipfs-cluster ipfs-cluster-ctl add /export/your_content
```

## Nebula Lighthouses

Generally nebula does not require the cluster hosts to be "public" (i.e. not
behind a NAT). The exception is that there must be a subset of hosts, called
lighthost hosts, which _are_ public and which let cluster members discover their
own and other members' ips.

Lighthouses have no special requirements except that they have a dedicated IP
address or DNS entry which always resolves to them, and are able to expose an
open port on that IP. They don't store any state or anything like that.

### Running a Lighthouse

By default Cryptorado-Node will use `config/host.yml` as the nebula
configuration, but lighthouses need to use `config/host.lighthouse.yml`, which
is an almost identical config file but with a couple small changes.

In order to make your node a lighthouse, set up the node as you normally would
(by getting a `.tgz` file from an admin and extracting it in your repo), then
run Cryptorado-Node using the lighthouse config:

```
export NEBULA_CONFIG=host.lighthouse.yml
docker-compose up -d
```

By default nebula uses port 4242, which is the one which must be publicly
available. In order to use a non-default port, use the NEBULA_PORT environment
variable:

```
export NEBULA_CONFIG=host.lighthouse.yml
export NEBULA_PORT=4040
docker-compose up -d
```

### Adding Lighthouses to the Config

Once a lighthouse is up and running, several changes need to be made in order
for other hosts to use it:

* `static_host_map` in `config/host.yml` and `config/host.lighthouse.yml` must
  be appended to. The key must be the lighthouse node's internal ip (the one
  assigned in `nebula_hosts.txt`), and the value an array containing at least
  one public address ("host:port") for the node.

* `lighthouse.hosts` in `config/host.yml` must have the lighthouse node's
  internal ip appended to it.

* `peerstore_default.txt` can optionally have the host added to it. This file
  lists a static set of peers in the ipfs-cluster. The format of each entry is:
  ```
  /ip4/<internal-ip>/tcp/9096/p2p/<ipfs-cluster-member-id>
  ```
  The `ipfs-cluster-member-id` can be determined by looking at the log output
  from the `ipfs-cluster` container, it will look something like:
  ```
  docker-compose logs ipfs-cluster
  ...
  ipfs-cluster_1  | 22:16:38.432  INFO    cluster: IPFS Cluster v0.11.0+git3c4859c74ca7093bae2a175e1a8f1406d6002e28 listening on:
  ipfs-cluster_1  |         /ip4/127.0.0.1/tcp/9096/p2p/12Dxxxxxxxxxxxxxxxxx
  ipfs-cluster_1  |         /ip4/10.42.0.1/tcp/9096/p2p/12Dxxxxxxxxxxxxxxxxx
  ```
  where the `12Dxxxxxxxxxxxxxxxxx` is the ipfs-cluster member ID.

Once all these files are modified, the changes should be committed and pushed.
All other members will need to pull the changes and restart their nodes in order
for them to use the new lighthouse. It is not necessary to do this immediately,
unless all other lighthouses are permanently gone.
