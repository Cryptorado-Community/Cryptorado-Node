# CORE-Node

Community Resource Node Software Development

## Development Group Chat

Main group chat is on Discord:


Internal team:
https://keybase.io/team/cryptorado (ask `nukemandan` for the node subteam invite)


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

## Inspiration

A non-exhaustive listing of projects, teams and software that should be used to understand the goals.
Some examples have some formal account required, and most are a single instance self-hosted by a core team.
This is not what the Cryptorado Node wants to create, but the types of  services are a fantastic bundle to study.
Ideally, these should all be **federated** and be able to have some redundancy that is hidden from end users so **all these services are sharded across a network of peer nodes**. 

- - -

### <https://disroot.org/en>

Disroot is a project based in Amsterdam which is maintained by volunteers and depends on the support of its community.

We originally created Disroot out of personal need, we were looking for software we could use to communicate, share and organize within our circles.
Most of the available solutions were missing the key elements that we find important; Our tools should be open, decentralized, federated and respectful towards freedom and privacy.

While searching for such tools, we found some really interesting projects, projects that we believe should be available to anyone who values similar principles.
We therefore decided to bundle some applications together and share them with others. This is how Disroot got started.

By running Disroot we hope to change how people typically interact on the web.
We want to encourage people to break free of the walled gardens of popular software and turn to open and ethical alternatives, may it be on our platform or on another (or you could even host your own).

Together we can form a network that is truly independent, focused on the benefit of the people rather than the exploitation thereof.

#### Services:

- **Email** | (not sure of backend)
	- Disroot provides secure email accounts for your desktop client or via a web interface. The communication between you and the mail server is encrypted with SSL, providing as much privacy as possible. Furthermore, all the emails being sent out from our server are encrypted as well (TLS) if the recipients email server supports it. This means that emails are no longer sent as traditional "postcard", but are actually put in an "envelope".

- **Cloud** | <https://nextcloud.com/>
  - Disroot's Cloud service is powered by Nextcloud. It allows you to host and share your files online and have several online functionalities, such as calendar sharing, contacts management, video calls and much more.
  - Nextcloud offers safe, secure, and compliant sharing solution based on standards compatible with any operating system. 
  - Most importantly, all your data is stored on our encrypted cloud instance! This means that no one is able to see the content of your files if not explicitly allowed by you. Not even system administrators.

- **Audio** | p2p calls https://www.mumble.info
  - Disroot's Audio is powered by Mumble. Mumble is a free, open source, low latency, high quality voice chat application. It was originally intended for gamers, but it can be use to organize audio meeting, conference, etc.

- **Forum** | <http://discourse.org>
  - Disroot's forum is powered by Discourse. Discourse is a fully open-source modern approach to discussion forums. It offers everything your community, group or collective needs to create their communication platform, both public and private. It also gives possibility for individuals to create topics on subjects of their interest and find others to discuss it with, or simply join already existing community.

- **Cryptpad** | <https://cryptpad.fr>
  - Disroot's Cryptpad is powered by Cryptpad. It provides a totally end-to-end encrypted collaborative office suite. It allows you to create, share and work together on text documents, spreadsheets, presentations, whiteboards or organize your project on a kanban board. All this with zero knowledge where data is encrypted before it leaves your computer.

- **XMPP Chat** | <https://xmpp.org> | implementation: <https://prosody.im>
  - Communicate using a standardized, open and federated chat protocol, with the ability to encrypt your communication with OMEMO protocol (based on encryption method also used by services such as Signal and Matrix). With XMPP you are not bound to one service provider (e.g. Disroot server) but can freely communicate with contacts from other Jabber servers, just like you would communicate between different email servers.

- **Pads** | <http://etherpad.org> | <https://github.com/ether/etherpad-lite>
  - Disroot's pads are powered by Etherpad. A pad is an online text that you can collaboratively edit, in real-time, directly in the web browser. Everybody's changes are instantly reflected on all screens.
  - Write articles, press releases, to-do lists, etc. together with your friends, fellow students or colleagues.
  - You don't need any account on Disroot to use this service.
  - You can use Padland on Android to directly open or create your Disroot's pads on your Android device.

- **Bin** | <https://privatebin.info/> | <https://github.com/PrivateBin/PrivateBin>
  - PrivateBin is a minimalist, open-source online pastebin and discussion board. The data of every pastebin is end to end encrypted/decrypted in the browser so that the server has zero knowledge of hosted data. You don't need any account on Disroot to use this service.

- **Upload** | <https://framagit.org/fiat-tux/hat-softwares/lufi> 
  - Disroot's Upload service is a file hosting software, powered by Lufi. It temporarily stores files so you can share them with others using a link. To protect privacy, all the files are encrypted in the browser itself - It means that your files never leave your computer unencrypted. The administrators will not be able to see the content of your file, nor will your network administrator or your ISP. The administrators can only see the file's name, its size and its mimetype (what kind of file it is: video, text, etc).

- **Search** | <https://github.com/asciimoo/searx>
  - Disroot's Search is a search engine like Google, DuckDuckGo, Qwant, powered by Searx. What makes it unique from others is that it is a metasearch engine, aggregating the results of other search engines while not storing information about its users.
- **Polls** | <https://git.framasoft.org/framasoft/framadate>
  - Disroot's Polls are powered by Framadate. Framadate is an online service for planning an appointment or making a decision quickly and easily. Create your poll, share it with your friends or colleague so that they can participate in the decision process and get the results! You don't need any account on Disroot to use this service.
- **Project Board** | <https://taiga.io/> | <https://github.com/taigaio>
  - Disroot's Project board is a project management tool powered by Taiga, working with agile methodology in mind. It creates a clear, visual overview of the current state of your project to anyone involved. It makes planning very easy and it keeps you and your team focused on tasks. Simply create a project, invite your group members, create tasks and put them on the board. Decide who will take responsibility for the tasks, follow progress, comment, decide and see your project flourish.

- **Calls** | <https://jitsi.org/jitsi-meet/>
  - Disroot's Calls service is a videoconferencing software, powered by Jitsi-Meet. It provides you high quality video and audio conferences, with as many partners as you want. It also allows to stream your desktop or only some windows to other participants in the call.

- - -

# Key Node Components

CORE will be crafted simultaneously from both the bottom up (in it's decentralized node architecture) and top down (in easy and intuitive UI for devs and users). Key plug-in features that interface with the node network will include:

- A shared  community/public cloud resource: Data, compute, and more. IPFS being the core. 
- A _static page_ community website (with [JAM stack](https://jamstack.org/) centered design)
  - An events listing calendar w/ RSVP add/remove capability for the user
  - A Jobs/Projects/Bounties board 
- A Federated chat server/client (matrix.org likely)
  - Eventually Directly Integrated into the static site
- A Federated Wiki
  - Built with tools like Github/Gitlab to enable similar style/flow to create and curate it's content
  
#### The kicker: this system will be designed such that _intrinsic_ motivations are the primary incentives to host and serve community resources. The network will maintain itself based on increasing access to features and utility on the network based on your increasing resource contribution to the network. _Thus no token of payment/extrinsic value (storj/filecoin) will be required to assure data being redundant and accessible on the community swarm._


## IPFS Framework for Swarm of Peer Nodes:

The [Community Resources (CORE)](https://github.com/Colorado-Community-Resources) project aims to develop a suite of tools for communities to self-host and maintain common shared resources on a semi-trusted distributed peer network. Each IPFS enabled peer node will also (optionally) be globally connected IPFS to spur adoption and use of IPFS outside the context of just this application and peer swarm. _CORE transcends it's needs integrating powerful tools that encourage and empower users to adopt distributed web technologies._ 

---
### Why IPFS?

1. The [swarm](https://github.com/ipfs/interface-js-ipfs-core/blob/master/SPEC/SAWRM.md) of semi-trusted peer nodes that are all [pubsub](https://github.com/ipfs/interface-js-ipfs-core/blob/master/SPEC/PUBSUB.md)'ed to each other will all host the community's shared resources. Thus the more nodes, and more live-time those nodes have, the more robust and redundant the network becomes. IPFS makes the management and sharing of data here very fluid, and revisions of data in the swarm easy to track and authenticate by know swarm members. Tools like [OrbitDB](https://github.com/orbitdb) make this even more streamlined.

2. IPNS enables signing of CIDs, as well as messages in general. We propose to use a client-side IPNS key-pair generator based on [BIP39](https://github.com/bitcoin/bips/blob/master/bip-0039.mediawiki) or similar methodology such that (as an optional plug-in to the base framework) a user's profile/login can amount to a brain wallet.
  - If one inputs the same string into the generator, they will client-side generate a unique static key-pair that can be used to prove to the swarm that they are the respective user associated with that IPNS address.
  - Open and public meta data hosted on the swarm about that IPNS address can be assigned an all iterations from that user can be signed by their respective private key from *any machine they decide to generate it in, on the fly*. Thus the UX is much like any central service for login, where account information comes up when they put in the right credential and all iterations on the network are attributed to you based on your IPNS ID. All without any central/single authority/maintainer in the system storing and authenticating user data. 
  - NOTE: Future plug-in integrations can leverage IPLD to easily incorporate any key-signing/user controlled ID utility for this service, such as 3Box or Uport

3. Nodes can easily open up to the full IPFS network (possibly by default on dedicated installed instances ) to enable adoption of the tech for a global network. Also incentivizes IPFS gateways to be community run at least one per swarm, so more entry points into IPFS in general. 

---
### Who would use it and how? :family_man_girl_boy: :family_woman_girl_boy: 

To start, the Colorado Blockchain community will pilot and battletest the software throughout development and beyond. The design is such that it will be best suited for 1st and possibly 2nd order socially connected people with a common set of resources they value in hosting for each other on their shared swarm. Much more and they dynamics will start to breakdown in the connective glue of _common values and personal reputation_ among semi-trusted and known peers.

The **intrinsic** motivation to host a node will be for recognition and clout within the community to start. The peer network can track metrics (on chain possibly?) of peers enabling a leader board of contributing members. This would also highlight to community members that there is _no central/outsourced entity  that operates this_ - your peers do. Impressing that you know the people who operate this service, and can show appreciation to them for it. This will be much further solidified by the (optional) ***requirement*** to host and keep-alive a node to post persistent shared data to the network.

The key working example: The community events/jobs/bulletin listings:
- To post a listing to the swarm, a node signals to the network that it is requesting a `publish` and others need to maintain it (signed with IPNS).
- On a qwery from a user for that information, the swarm will check to see if the publishing peer is live. If not, the user will not be shown the event listing. If so, and a user clicks to learn more, they will be directed to the live peer. 
  - This enables P2P analytics. A node can track interactions with it's publications, but only when live. They can also E2EE communications with that user if required.
  - If `POST` like method is needed (like RSVP to an event) the publishing node now directly records that information, and does not necessarily have to share it with the rest of the swarm (like private guest lists). Again, a win for analytics and privacy for being live.

We would also pilot a community decided "paywall" on content hosted by non-persistent nodes/users. Example: Your chat messages are community hosted for 30 days, and then are garbage collected. If you would like to persist them, you need to run a node that stores your own history and refreshes the content across the network when garbage collected. (Or optionally _pay your peers_ to do it for you via stoj or filecoin plug-ins)

#### The long-term goal is that we build a solid CORE framework that is easy for any other community to fork and make their own swarm with the plug-in features they collectively desire. We also endeavor to make the framework interoperable in a higher-order community federated network. This is another place the IPFS excels - that all swarms will use a common name space for CIDs, IPNS, and interface to share across any IPLD network. We hope that a nested mesh of swarms develops and communities of communities form around a different sate of core resources and values they share. Further this (kinda in secret) is a way to drive the use of IPFS natively by all community members because it is the best/only way to access these utilities. But once you have a node installed, you also are now native to the global IPFS network! What better way to get adoption, eh? 

---
### How would it be implemented? :construction_worker_woman: :construction_worker_man: 

Possible contender for the core database: [Orbit DB](https://github.com/orbitdb/orbit-db)

There will be two (possibly up to four) methods to run a node, increasing in the level of hardware requirements, commitment to the community, and desired access to features by node hosts. 

#### In Browser Only

A [js-ipfs] in-browser node that will (while the community site is loaded) also host and serve minimal components of the community resources - like the website itself. But this instance will not persist data.

This level of support would only afford (optionally) minimal prfiles/accounts on the community resources.

#### Browser Extension (optional)

If a user wants to run something in a more dedicated way - whenever they have a browser open, along with ability to have more personal connection and persistent storage of data via the  community node network. this would also open up more resources dedicated to hosting reources for the community at large.

Browser Extension for IPFS: [ipfs-companion](https://github.com/ipfs-shipyard/ipfs-companion)

#### PWA / Mobile App (optional)

A PWA that can be installed and set to run on any device in the background/ Similar functionality to the extension, but now if your device is up and connected at all, you are active.

#### Deploy-able / Dedicated Installation

A Containerized Deploy-able / Install-able Node ([go-ipfs](https://github.com/ipfs/go-ipfs) + docker/podman). This can persist data, and optionally provide more resources for the community - like a community IPFS gateway, and very high uptime/throughput.

---

## Further plug-in Integration:

### Self-Sovereign User/Profile Management

- IPNS (see `Why IPFS?` section)
- Ethereum based solution(s):
  - [UPort](https://www.uport.me)
  - [3Box](https://3box.io/)

### Skin-in-the-game mechanisms

- [Protea](https://www.protea.io/)

### Federated Chat:

- [Matrix](https://matrix.org)
- [Rocket](https://rocket.chat/)
- Others?

### Wiki
- [PeerPad](https://github.com/ipfs-shipyard/peer-pad) - as IPFS native document + shared editing
- [TiddlyWiki](https://tiddlywiki.com/) a unique non-linear notebook for capturing, organising and sharing complex information.
