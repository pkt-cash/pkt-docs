# Infrastructure

## Introduction
This strategic technology upgrade of PKT on Base coincides with the launch of a novel Stake-to-Earn protocol. This offers participants significant daily PKT rewards for staking PKT.

Coming October 30, 2024 is Infrastructure Day, when users will be required to pair each stake with an infrastructure node to continue earning staking rewards. There are 5 different node types, ranging in operational complexity, with different infrastructure requirements and yields.

Instead of mining, PKT holders can stake their tokens and pair with infrastructure nodes to earn yields. To incentivize operators to make long term commitments to run infrastructure for the network, there are yield bonus multipliers based on staking duration.

## Infrastructure Yields
Starting on Infrastructure Day, October 30, 2024, each stake will be required to pair with at least one PKT Network infrastructure node in order to continue earning yields.

Operators will be able to assign yield credits to each PKT infrastructure node. Instead of all yield credits competing for one bucket of yields, there will be one bucket for each of the 5 types of infrastructure in the PKT network. One lockup can assign yield credits to multiple units of infrastructure, but one unit of infrastructure can only be assigned yield credits from one lockup.

### Cjdns Nodes
40% of all yields will go to cjdns nodes which have an open port and public peering credentials, so anyone can connect.

1. Operators can assign up to $5,000 worth of yield credits per cjdns node, with each yield credit being valued at 1 PKT
2. Yields will still be allocated based on yield credits, so if the PKT price goes up, older cjdns nodes will be “grandfathered” in and be able to hold more yield credits than newer ones, and thus yield better. If the PKT price goes down, node operators will be able to increase their assigned yield credits if they so choose.
3. Every cjdns node will be tested each week, and if the node is found to be in a non-functional state, the node will lose yields for that week. If a node fails 4 weeks in a row, it will be removed from the roster and when it comes back online it will be capped at $5,000 worth of yield credits based on the value at the time it comes back.
4. In order to incentivize geographical distribution of nodes, cjdns nodes will get a bonus if they are on IP address blocks, or ISPs that have few other cjdns nodes, as follows: Effective yield credits are equal to real assigned yield credits TIMES:
    - One over (“divided by”) the number of cjdns nodes running on your IPv4 address, plus

    !!! note "Note"
        Running multiple cjdns nodes on the same device is _not efficient_.

    - One over the number of cjdns nodes running in your IPv4 address block, plus

    !!! note "Note"
        What is an IP address block? An address block is a group of IP addresses which all belong to one ISP, and which internet core routers treat as a single unit, you can see the public address block of your public IP address by going here: [https://bgp.he.net/](https://bgp.he.net/)

    - One over the number of cjdns nodes running in your ISP, plus

    !!! note "Note"
        For our purposes, your “ISP” is the [AS Number](https://en.wikipedia.org/wiki/Autonomous_system_(Internet)) which controls your public IP address.

5. To incentivise high reliability cjdns nodes, your effective yield credits will be multiplied by the square of your node’s uptime. So if your cjdns node is only online 50% of the time, you will only get 25% of the yields that you would with it being online 100% of the time. At 80% uptime you get 64% yields, at 90% uptime you get 81% yields.
    ![Yelds](cjdns-nodes.webp)
6. In addition, you will get 5 more effective yield credits for every 100 (real) yield credits which are assigned to cjdns nodes as a result of you introducing people to the project with your affiliate code. These are not affected by your node’s uptime, it just has to be online enough to pass the weekly test.
7. These rules are complex, but there is a simulator and you can type in any IP address and see the effective yield credits and simulated yield for a cjdns node running on that address.