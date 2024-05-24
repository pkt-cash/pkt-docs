# How to Run a Pktd Full Node
Pktd is the PKT full node blockchain software. It is a fork of btcd, the golang bitcoin instance.

## Running a full node
If you want to run a full node in the PKT network, you can do so by downloading pktd and compiling
it on a Linux or Mac server. Follow the process in [Installation](#installation) and the simply type
`./bin/pktd` and it will start up and begin syncing the chain and helping verify the PKT network.

**NOTE**: Running a full node requires over 40 GB of disk space to store the blockchain and is
*not necessary* for participating in the project. If you just want to make a wallet, see
[PKT Electrum](../electrum) (gui) or [PKTWallet](#pktwallet) (command line) wallets.

### Installation

#### Install golang
First, you need to install the go programming language, go to the golang website and learn how to
install it on your system:

[https://golang.org/doc/install](https://golang.org/doc/install)

#### Install git
Next you will need to make sure you have git installed. The first thing to do is check whether you
have it installed already:

    git version

If it prints something like `git version 2.21.1` you’re in luck and you can continue. If it prints
something more like `command not found: git` then you’ll need to install it.

Installation will depend on your system, for debian/ubuntu like systems you will want
`sudo apt install git` and for OSX with homebrew, you’ll want `brew install git`.

#### Install the components
Once you have golang and git fully installed and set up, you can use the following commands to
install pktd, pktwallet and pktctl.

    git clone https://github.com/pkt-cash/pktd
    cd pktd
    ./do

If you see something like: `Everything looks good` at the end of typing `./do` then you should be
ready to start using pktd.

