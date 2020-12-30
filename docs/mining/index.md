
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

To use, you can comple from source or run from a [Docker](http://docker.com/) image.

## Running from Docker

If you want to get up and running quickly, you can run the [PacketCrypt  Docker image](https://hub.docker.com/r/backupbrain/packetcrypt) from your terminal line or command line.

Docker is a virtual machine software that allows users to run software without the hassle of installing that software on their computer directly.

### Installation



Install docker on your computer. You can follow the [Docker installation instructions](https://docs.docker.com/get-docker/) for your operating system.


Next, download the PacketCrypt docker image. Make sure Docker is running on your computer and open a terminal or macOS or Linux, or `cmd` on windows and type:

```
docker pull backupbrain/packetcrypt
```

This will download the PacketCrypt binaries and runtime environment onto your computer.

To begin mining, you will need to [choose a mining pool](#choosing-a-mining-pool).

You can mine announcements by passing the `annmine` option and you can mine blocks by passing the `blkmine` option.

The basic syntax for using the PacketCrypt miner is:

```
docker run pktcrypt-miner [annmine|blkmine] <pool_url>
```

**Example: Announcement mining:**

To mine announcements on the Gridfinity network, run this command in your terminal or cmd:

```
docker run pktcrypt-miner annmine http://pool.gridfinity.com/master
```

**Example: Block mining:**

To mine blocks on the Gridfinity network, run this command in your terminal or cmd:

```
docker run pktcrypt-miner blkmine http://pool.gridfinity.com/master
```
That's it! You'll see status messages about mining scroll through your terminal window as  blocks or announcements are discovered.

## Installing from Source

### How to Announcement mine

#### Install the dependencies

* On Debian or Ubuntu: `sudo apt install gcc git`
* On Fedora or RedHat: `sudo dnf install gcc git`
* On Alpine Linux: `sudo apk add gcc git`

#### Install Rust
It is important to install Rust using rustup because packaged Rust is often out of date and
compiling will fail. Run the following command *as the user who will be mining*.

    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

#### Download PacketCrypt

    git clone https://github.com/cjdelisle/packetcrypt_rs

#### Compile PacketCrypt

    cd packetcrypt_rs
    ~/.cargo/bin/cargo build --release

#### Begin Mining
To begin mining, you will need the address of your [wallet](./electrum) and you will
need to choose a pool.

    ./target/release/packetcrypt ann -p <your_wallet_address> http://your.pool.of.choice

## Choosing a mining pool
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

## PacketCrypt Data Flow
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

## More information and PacketCrypt pool code
The code and documentation for running a pool is available on the **C / nodejs** version of the
[PacketCrypt](https://github.com/cjdelisle/PacketCrypt/blob/master/docs/pool.md) project,
the new Rust version only contains Announcement Miner and Announcement Handlers.

## Announcement Difficulty
PacketCrypt is designed in such a way that a mining pool can double its effective power by:

* Doubling the total block mining computation effort
* Doubling the total announcement mining computation effort, or
* Dubling the amount of bandwidth between announcement miners and the pool

The way that a pool operator limits the amount of bandwidth flowing into the pool, to prevent
overloading of the network, is by setting what is known as the *announcement difficulty*. The
announcement difficulty for a pool specifies how much work must be done on an announcement in order
for the announcement to be accepted and paid out by the pool. Announcement difficulty serves to
slow down the announcement miners to protect the pool's network.

In general, doubling the announcement difficulty will halve the amount of bandwidth used by the
pool and will also halve the pool's overall mining power, with a limit that setting the announcement
difficulty lower than `2` does not bring any additional value. To explain why it works like this,
we need to examine the PacketCrypt algorithm rules and the in particular how the block mining software
decides which announcements to use when attempting to mine a block.

### Announcement Set Selection
PacketCrypt algorithm allows block miners to perform less work if they are able to prove that they
had a certain number of "high value" announcements in memory at the time of mining, the exact ratio
of actual work a block miner must do to the amount of work the PKT blockchain requires is called the
*power multipler*.

For a block miner seeking to optimize their power multiplier, every announcement has a particular
level of utility value which is based on the amount of work that was done by the announcement miner
(announcement difficulty) *and* how old the announcement is. We call this the *effective difficulty*.

The effective difficulty of an announcement starts off as the actual difficulty of the work done to
mine it and then decreases by half every block-period until it is less than 1 and the announcement
is nolonger usable for mining.

The block mining software selects a subset of announcements which which will give it the best
power multiplier based on the PacketCrypt algorithm:

    power_multiplier = min(effective_difficulty) * ann_count ** 2

The `min(effective_difficulty)` is the effective difficulty of the "least valuable" announcement
that is being mined with.

Lets assume that announcement miners are providing a steady supply of 1000 announcements per
block-period and all announcements have an initial announcement difficulty of 128. The block mining
software can choose to mine with 1000 announcements at 128 effective difficulty, or with 2000
announcements at 64 effective difficulty, or with 3000 announcements at 32 effective difficulty and
so on.

![ann_selection.png](./ann_selection.png)

The best choice is to use the previous *three* block periods which provides a power multiplier that
is 225% higher than that of using just the most recent 1 period worth of announcements. This curve
is the same no matter what difficulty we are starting with.

### Optimal Difficulty Curve
Knowing that the optimal announcement set is all of those announcements mined over the past 3 block
periods, we can compute the overall power of a pool as the announcement difficulty is raised.

At announcement difficulty 1, announcements cannot be used for more than 1 block, but if we imagine
that the announcement mining community can produce 1000 announcements per block at difficulty 1 then
we can reason that the power multiplier will be `1000 ** 2` or 1 million.

At difficulty 2 we can expect the announcement miners will produce 500 announcements per block period
but since 2 block periods can be used, the power multiplier is the same.

At difficulty 4, the announcement miners will produce 250 announcements per block period and they
will be valid for 3 block periods making the power multiplier `750 ** 2` or 562,500.

![ann_diff_power.png](./ann_diff_power.png)

From here, the power output of the power multiplier of the optimal announcement set halves for each
doubling of the announcement difficulty, making the optimal difficulty `2`.