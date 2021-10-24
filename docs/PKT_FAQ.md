# PKT FAQ

This is a community defined FAQ, [edit this page](https://github.com/pkt-cash/pkt-docs/edit/main/docs/PKT_FAQ.md) to improve it.

## General

### What is PKT?
> PKT allows users to monetize their unused internet bandwidth. By participating in the PKT Network you are helping to build a faster, stronger, and more secure, decentralized network.

### What is PKT Cash?
> PKT is a native mined coin based on an open source project. There are multiple companies in the PKT ecosystem but no company "behind PKT."

### What wallets are available?
> * If you're not mining, the best wallet is [PKT Electrum](https://docs.pkt.cash/en/latest/electrum/), which was developed as part of a Network Steward funded project and supports Windows, Mac and Linux. However, **mining into electrum will break it** and if you do it, you will need to [export your keys](https://docs.pkt.cash/en/latest/pktd/migrating_from_electrum/) to recover funds.
> * If you use Microsoft Windows, the best wallet to use is [PKT.world wallet](https://www.pkt.world/wallet)
> * If you use Mac and want to mine, you can use [Zulu Wallet](https://github.com/artrepreneur/Zulu)
> * If you are using a server, you can use the [CLI wallet](https://docs.pkt.cash/en/latest/pktd/pktwallet/) which is the base code for the PKT.world wallet and Zulu wallet.
> * There is an ongoing wallet called MatterFi which is based on the powerful OpenTransactions technology. You are invited to help beta-test this wallet in [#matterfi](https://pkt.chat/pkt/channels/matterfi) on pkt.chat.

### Where can I buy or sell PKT?
> Currently there are two ways to buy and sell, you can buy [wrapped PKT](https://coinmarketcap.com/currencies/wrapped-pkt/) on pancakeswap and then un-wrap it using the [ODAPP](https://odapp.io/) (NOTE: in order to use wrapped PKT, you will need [Binance Smart Chain BNB](https://www.binance.org/en/smartChain) to pay gas fees. Also note that ODAPP charges 3.5% when wrapping or unwrapping)
> 
> If you would like a more human experience of buying or selling, you can come to [ye ol' telegram chat](https://t.me/joinchat/VTzmffhbXP0mrd9-) where PKT has been traded since the beginning. Remember that telegram is a place where scammers lurk, so always read and follow the guidelines and always use escrow, *even* after you have traded with somebody multiple times.

### What is the path towards being publicly listed on exchanges?
> PKT is a decentralized project like Bitcoin, not a centralized token. Community members are having conversations with different exchanges and you can do it too. There are no more details at this time about the particular listing initiatives.

### The differentiating factors vs. Bitcoin and other crypto coins?
> The differences from Bitcoin are: 
PacketCrypt bandwidth hard proof of work replaces SHA-256
1 minute block time
6 billion coins total
Mining yields decrease 10% every 100 days in what is called the decimation
20% of each mined block goes to the Network Steward wallet, which funds R&D of the ecosystem

## Vision

### What is value proposition of PKT?
> The PKT project is focused on building a decentralized bandwidth marketplace to decouple the business and technical aspects of internet service from the physical aspect of maintaining infrastructure. The fundamental value is division of labor and lowering the barrier of entry for internet service competition.

### What is a Cloud ISP?
> There is [an explanation video](https://twitter.com/pkt_cash/status/1374050101094617091?s=21) about Cloud ISPs on Twitter. The role of a Cloud ISP is to perform the technical and administrative aspects of internet service so that the aspects of infrastructure operation can be done by individuals, small businesses and community groups.

### What do you see as the greatest challenge to PKTs long-term success?
> Historically, crypto projects achieve the best results when they are focused on use cases and utility. PKT is focusing on building a decentralized bandwidth marketplace where people can earn PKT with their internet and use PKT to pay for connectivity. The greatest challenge is getting the next billion people connected to the internet.

### What are the applications and software currently being explored?
> A free to use VPN service called AnodeVPN will be launched in 2021, and users can pay for their VPN speed with PKT Cash. Internet bandwidth sharing and mesh networking are also currently in the stages of development. 


## Mining

### How is PKT mined?
>PKT is mined using the novel PacketCrypt bandwidth-hard mining algorithm which requires bandwidth to mine. It uses a combination of CPU and bandwidth, you get an advantage by working together with other miners which requires bandwidth.

### How will the growth in mining impact the coin?
>As more people mine PacketCrypt, they will need to invest in more network infrastructure which will become useful later on for making the internet faster and more accessible.

### What wallet do I use for mining?
> For mining it's recommended to use the command line [PKTWallet](https://docs.pkt.cash/en/latest/pktd/pktwallet/) due to the amount of mining transactions and it's ability to scale. If you use a Mac then you can also use the [PKT-Cash-Wallet](https://github.com/artrepreneur/PKT-Cash-Wallet/releases) for MacOS.

### Is there an easy way to start mining?
> There are [mining instructions](https://docs.pkt.cash/en/latest/mining/) for mining on the PKT website. [PktPal](https://pktpal.com/) is a business in the community which offers turn-key mining solutions.

### Do miners mining on a single pool have any benefit over miners mining on multi pool?
> Multi-pool mining means submitting the exact same announcements to multiple pools. So if you have the bandwidth available it will always benefit you to mine in all of the major pools.


## Network Steward

### What is the Network Steward?
> The Network Steward is part of the consensus rules of the PKT blockchain. 20% of every newly mined block goes to a wallet address and then those coins are 100% paid out in grants to help build open-source technology and develop the PKT Network. Network Steward funds must be deployed within 90 days or else they are  burned. This address was initially set to a multi-signature group, but it can be changed by a PoS based vote process.

### Who is the Network Steward currently?
>A group of 5 volunteers including the original author of the code.	More information can be found [here]: (https://pkt.cash/network-steward)
																				
### How is the (current) Network Steward using the funds?
> The Network Steward follows a [project evaluation process.](https://github.com/pkt-cash/ns-projects/)  
No funds have ever been deployed except to fund projects which were proposed by members of the public in an open competitive process. The Network Steward operates with full transparency. Every transaction made by the Network Steward can be seen in the block explorer and is refered to in the Network Steward's github repository explaining the project which that transaction helped to fund.	

### Has the Network Steward burned any funds?
>You can check out the stats on burned coins in the block explorer [Network Steward page](https://explorer.pkt.cash/address/pkt1q6hqsqhqdgqfd8t3xwgceulu7k9d9w5t2amath0qxyfjlvl3s3u4sjza2g2).

### How do I submit a proposal?
> There are currently two ways to propose a project to the PKT Network Steward, if your project is large and has the benefit of accountants to be able to verify that the money has been spent appropriately, you can make a proposal directly to the NS through the NS github [Network Steward's Github](https://github.com/pkt-cash/ns-projects/). The NS opens calls from time to time with a specified budget and during these calls anyone can apply.
> If you want to propose a smaller project and have the accounting and official reporting managed for you, you can propose to the [User Operated Internet](https://nlnet.nl/useroperated/) fund which is funded by the Network Steward but is administored by NLnet, a well respected public benefit organization which is experienced at managing these types of projects.



## Dilligence

### Who is the creator? Is he actively involved? What's his ownership?
> PKT was created by Caleb James DeLisle, the creator of cjdns. Cjdns is the only decentralized mesh networking protocol which is designed to function in even if some of the nodes in the network are adversarial. Caleb has been mining PKT similarly to everybody else in the project.

### Who stands to benefit the most from growth and adaption?
> The early miners and adopters of PKT will benefit greatly. PKT also benefits everybody because it will lead to a lower cost and highly competitive internet service ecosystem.

### Are there any regulatory or compliance liabilities?
> PKT is a fully decentralized fork of Bitcoin, so it is similarly considered to be a commodity.

### What legal disclosures need to made with investments into this? Or are there none?
> Because PKT is a fully decentralized clone of the Bitcoin codebase, the legal and regulatory framing is probably similar.


## Communication

### Has any branding or marketing already been completed?
>PKT is a decentralized project so there is no official brand for PKT, however the website pkt.cash, logos, and other materials were developed as part of a Network Steward funded project and are usable under the Creative Commons license.

### Are any brand ambassadors already engaged?
> PKT is not a centralized project so anybody can be an ambassador. There are a number of companies and initiatives which currently exist in the PKT ecosystem including AnodeVPN and Pkt Pal.


## Commercial

### How can I contact the PKT Team
> You *are* the PKT team, PKT is a fully decentralized project like Bitcoin, so everyone is the team. The bad news is there is no central authority who can write you a check, but the good news is there are a few businesses in the PKT ecosystem who might be prepared to buy your services. See [PKT Commercial](https://docs.pkt.cash/en/latest/commercial/) for a (non-exhaustive) list.

### Can I build X with PKT?
> *YES*, the PKT community encourages all types of (legal, responsible) business activity in the PKT ecosystem. The [ODAPP](https://odapp.io/) bridge was created by a community member and was not in the original PKT vision but this bridge is now an important part of the infrastructure of the PKT ecosystem. You can also build your commercial venture and the we in the PKT community will do what we can to help you be successful.

