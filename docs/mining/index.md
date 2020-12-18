# Mining
PacketCrypt is a *bandwidth hard proof of work*, this means it requires lots of bandwidth to mine.
Miners collaborate with one another by sending small messages (called *Announcements*) and the
sending of these messages requires a large amount of *bandwidth*.

Miners who are working in collaboration with one another are members of a mining pool, therefore
all mining of PacketCrypt is done in pools.

PacketCrypt mining is split into two distinct stages:
* Announcement Mining - Using your CPU to create Announcements
* Block Mining - Collecting Announcements from Announcement Miners and using them to mine blocks

Block mining is typically done at the mining pool's datacenter, however Announcement mining can be
done from anywhere.

## How to Announcement mine

### Install the dependencies

* On Debian or Ubuntu: `sudo apt install gcc git`
* On Fedora or RedHat: `sudo dnf install gcc git`
* On Alpine Linux: `sudo apk add gcc git`

### Install Rust
It is important to install Rust using rustup because packaged Rust is often out of date and
compiling will fail. Run the following command *as the user who will be mining*.

    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

### Download PacketCrypt

    git clone https://github.com/cjdelisle/packetcrypt_rs

### Compile PacketCrypt

    cd packetcrypt_rs
    ~/.cargo/bin/cargo build --release

### Begin Mining
To begin mining, you will need the address of your [wallet](./electrum) and you will
need to choose a pool.

    ./target/release/packetcrypt ann -p <your_wallet_address> http://your.pool.of.choice

## Choosing a mining pools
There are currently two mining pools:

* Gridfinity: `http://pool.gridfinity.com/master`
* Flufpool: `http://pool.noworries.tech`

Your mining revenue depends on how high the pool's fee is as well as how much hardware they are
using in-house. You should test your daily earnings on each pool to see which one is best.

## Block mining & running a pool
Because each block miner must use as much bandwidth as all of the announcement miners *combined*,
block mining is typically done at the location of the pool. Even a pool operator who wanted to
support external block mining would find that the pool itself would need enough *upload* bandwidth
to match all of the block miners - which would is completely untennable. If you are interested
in block mining, contact the pool operator and discuss sending hardware to their location.

Starting your own pool requires setting up a number of services:

* *pktd node* (one or more) - One pktd instance is required for the Master to function, each of the
*Block Handlers* may optionally use separate pktd nodes.
* *Master* (one) - This node coordinates all of the others and provides work files and configuration
* *Ann Handler* (one or more) - These are high performance nodes which accept announcements from the
announcement miners in the network, they also provide announcements to the block miners. As you
scale up the amount of bandwidth in the pool, you will need to add more Ann handlers.
* *Block Miner* (one or more) - These nodes download announcements from the announcement handlers and
use them in the mining process to mine blocks.
* *Block Handlers* (one or more) - These nodes receive "block shares" from the block miners and
submit blocks if
* *Paymaker* (1) - This node receives updates from the Ann Handlers and Block Handlers and keeps
track of who should be paid. The Paymaker sends configuration to the pktd node which is used by the
Master in order to make the pool pay out the announcement and block miners 

### PacketCrypt Data Flow
![packetcrypt_data_flow](./packetcrypt_data_flow.png)

* <span style="color:#ff9900">█</span> Orange: Announcements are sent from the Announcement miners
to the Ann Handlers and then to the Block miners
* <span style="color:#0000ff">█</span> Blue: Block shares are sent from block miners to Block
Handler(s)
* <span style="color:#9900ff">█</span> Purple: Winning blocks are submitted by the Block Handler(s)
to pktd and the PKT network
* <span style="color:#ff00ff">█</span> Pink: Block Handlers and Ann Handlers inform Paymaker of work
done by announcement and block miners
* <span style="color:#6aa84f">█</span> Green: Paymaker configures pktd instance to create blocks
which pay the people who have been mining
* <span style="color:#783f04">█</span> Brown: Master gets block templates from pktd instance
* Black dotted line: All nodes request configuration and block templates from Master node

### More information and PacketCrypt pool code
The code and documentation for running a pool is available on the **C / nodejs** version of the
[PacketCrypt](https://github.com/cjdelisle/PacketCrypt/blob/master/docs/pool.md) project,
the new Rust version only contains Announcement Miner and Announcement Handlers.
