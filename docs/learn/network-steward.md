# What is the Network Steward?

## Introducing the Network Steward
The Network Steward is a mechanism built into the PKT blockchain to ensure there is continuous funding to build out the project roadmap. Since PKT is completely decentralized, with no central company, foundation or investors behind the project, the Network Steward is able to provide perpetual funding for development. 

As part of the consensus rules of the PKT blockchain, the publicly visible Network Steward wallet address receives 20% of every newly mined block. 100% of the funds are mandated to be paid out in the form of grants towards funding the Network Steward’s areas of interest, including open-source technology development of the PKT Network. Unlike a pre-mine or founder's fee, the recipient of the Network Steward payout can be changed by a PoS vote. All coins that are not allocated within 129,600 blocks (~3 months) are automatically burned. More than 13% of the mined coins have been burned through 2022.

You can check out the status of the burned coins and PoS vote to re-elect the Network Steward page on the block explorer page [here].

`https://explorer.pkt.cash/address pkt1q6hqsqhqdgqfd8t3xwgceulu7k9d9w5t2amath0qxyfjlvl3s3u4sjza2g2`

## Who is the Network Steward?
This Network Steward address is a multi-signature group that requires 3 out of 5 signatures in order to make a payment. The current Network Stewards* are:

* **Cjd** — cjdns original author
* **Arceliar** — Yggdrasil original author
* **Benhylau** — Contributor at Toronto Mesh
* **NeilAlexander** — Yggdrasil release manager
* **Backupbrain** — Creator of NetNinja VPN device

*All of the participants have agreed not to enter into any relationships which would affect their ability to act impartially on behalf of the PKT project.*


## How does the Network Steward Operate?
The persons in custody of the Network Steward wallet periodically meet to award grants in accordance with a strict criteria and mandate.

The current mandate is that funds are to be used for:

1. Financing the development of open source software, technology documentation and education resources for the PKT Network and community.
2. Lobbying for an improved regulator environment for small network operators and more generally, to promote internet freedom, privacy, and decentralized internet access.
3. Purchasing property such as proprietary software or radio frequency spectrum rights in order to put these things in the commons.

It is the belief of the PKT blockchain founding developers that any unaccountable authority, no matter how benevolent, will eventually fall victim to corruption, inefficiency or simple failure to innovate. Because of this, the PKT blockchain has an impeachment solution whereby every holder of PKT is able to cast a vote to impeach the Network Steward so a new Network Steward can take its place. Impeachment is not an insignificant event. For it to occur, it requires more than a 50% of the total PKT ever mined to “VoteFor” impeachment. If impeachment does occur, what follows is an automatic vote count and a change to the Network Steward address.


## How are Grants Awarded?
Grants are awarded based on a funding criteria that is outlined on the Network Steward Github [here]. You start by socializing what you want to do with the community (try PKT.Chat, Discord or Telegram). When you have rough consensus, you move that conversation to a formal proposal.

There are currently two ways to propose a project to the PKT Network Steward. If your project is large and has the benefit of accountants to be able to verify that the money has been spent appropriately, you can make a proposal directly to the Network Steward through its github [here]. 

Click [here] to submit a proposal
Click [here] to download the submission template

The Network Steward opens calls with a specified budget from time to time. Anyone can apply during these open calls. The Network Steward meets several times per year to review submitted projects. The minutes of these meetings are published in the github repository, along with the ongoing project statuses. Every transaction made by the Network Steward can be seen in the block explorer and is referred to in the Network Steward's github repository explaining the project that was funded.

To make a proposal, you must create a pull request to the github repository and name it according to the naming convention defined in the repository readme. This adds a new project markdown file, as per the project template. Getting a proposal accepted is much like getting a pull request merged into a project.

If you want to propose a smaller project and have the accounting and official reporting managed for you, you can propose to the User Operated Internet fund [here], which is funded by the Network Steward and administered by NLnet. NLnet is a well respected public benefit organization that is experienced at managing technology development projects.

## Network Steward Voting
### How voting works
A vote consists of one two parts, VoteFor and VoteAgainst. VoteAgainst is a vote for impeachment, while VoteFor is a vote for who should become network steward in the event of an impeachment.

A network steward is represented as a transaction output script rather than a script encoded key. An easy way to get the script for a given address is to pay some money to it and then explore the raw transaction and copy the output.

Exploring a coinbase transaction we can see the output being paid to the network steward https://explorer.pkt.cash/address/ and the script for this output is

`0020d5c1005c0d4012d3ae2672319e7f9eb15a57516aeefabbbc062265f67e308f2`

If we double-check by querying pktd to find out what is the network steward, we will see that it shows the script that was paid to. So if we wanted, for instance, to change the network steward to https://explorer.pkt.cash/address/pGzmtW4Q2v4AWHcX8TYGqG5c1Eh5Ykg6fX, we would want to vote for the corresponding script

`76a9147d9df4279212fd7def4c47abf2d5f3a6c6eaf4ae88ac`

and of course we probably want to vote against the current network steward as well.

### How to vote
Voting is done by configuring your wallet to vote, whenever you spend money, your wallet will include a vote in every future payment of PKT which is made. If you want to speed up the voting process, you can configure your wallet to vote and then transfer all of your PKT to another wallet, in order to be sure it will all be voting.

To configure your wallet to vote for https://explorer.pkt.cash/address/pGzmtW4Q2v4AWHcX8TYGqG5c1Eh5Ykg6fX and against https://explorer.pkt.cash/address, you would use the following workflow:
