
# pktwallet

The command line PKT wallet

---

# First Time Installation and Launching

## Download pktd

### Microsoft Windows

- Download the most recent zip archive suffixed with `-windows.zip` available from  
  [pktd releases page](https://github.com/pkt-cash/pktd/releases)

For example: `pktd-v1.4.0-windows.zip`

- Unarchive the content of the zip file
- Open the command prompt and navigate to the bin directory in the extracted archive
- For Example: `cd Downloads\pktd*\bin`
- Follow the instructions below but
  - In place of `./bin/pktwallet`, use `pktwallet.exe`
  - In place of `./bin/pktctl`, use `pktctl.exe`

### MacOS and Linux

- Download one of the most recent packages available for Linux or MacOS from  
  [pktd releases page](https://github.com/pkt-cash/pktd/releases)

For example, for `pktd-v1.4.0` release:

- For **MacOS**, after having downloaded `pktd-v1.4.0-macos.pkg`,  
  install `pktwallet` and other utilities by clicking on the package icon in the Finder.

- For **Linux**, after having downloaded one of the following packages:
  - `pktd-v1.4.0-linux.deb` (Debian or Ubuntu)
  - `pktd-v1.4.0-linux.rpm` (Fedora or RedHat)
  - [pktd AUR package](https://aur.archlinux.org/packages/pktd) (Arch linux or Manjaro),  
    install `pktwallet` and other utilities by clicking
    on the appropriate package icon or running an installation command

## Creating a New Wallet

To create a new PKT wallet, use the pktwallet --create command:

    ./bin/pktwallet --create

You will be prompted to follow a few steps. Make sure you write your seed words on paper so that you can
recover your funds even if your computer is damaged. Do not skip this step. You will thank yourself later. Keep it secret. Keep it safe.

## Launching pktwallet

After creating your wallet, you can launch pktwallet with:

    ./bin/pktwallet

Watch the output from the logs and when you see a log line like this:

    1608294386 [INF] headerlogger.go:64 Processed 1 block in the last 24.82s (height 702781, 2020-12-18 13:26:01 +0100 CET)

Compare the height number in the log line (e.g. 702781) to the number in
[the pkt block explorer](https://explorer.pkt.cash) to see when your wallet is up to date. A complete sync from a new installation can take 12+ hours. During this time, the balance in your wallet will not be accurate and you will be unable to transact. You may, however, proceed with creating an address while syncing, as detailed below.

## Creating a New PKT Address

While pktwallet is running in the background (or in another terminal), use the following command:

    ./bin/pktctl --wallet getnewaddress

You should see a series of numbers and letters beginning with `pkt1`. This is your newly created PKT address which you can use for receiving coins. If you need to view it after creation, the address, along with the balance, can be seen in the output from running:

    ./bin/pktctl --wallet getaddressbalances 1 1

**NOTE**: Every time you use `getnewaddress`, the address you receive must be remembered by pktwallet forever. So, only use it when you actually need an address.

# Using Your Wallet

pktctl is the program that interfaces with a running pktwallet instance. pktctl functions will not work if pktwallet is not running and accessible. Some functions will be limited until pktwallet is fully synchronized. Some functions require the wallet being unlocked before executing.

## Getting Your Balance

You can check your current PKT balance using pktctl or you can check the balances of each of your addresses if you have more than one.

    ./bin/pktctl --wallet getbalance

or:

    ./bin/pktctl --wallet getaddressbalances

`getaddressbalances` by itself will not show 0 balance addresses you may have created. To show these addresses, use:

    ./bin/pktctl --wallet getaddressbalances 1 1

For more explanation of the meaning of the output of `getaddressbalances`, use:

    ./bin/pktctl --wallet help getaddressbalances

## Unlocking Wallet

While many functions can be performed while the wallet is locked, other functions first require the wallet to be unlocked, including sending PKT and folding. The passphrase used to unlock the wallet was set when creating the wallet.

To unlock your wallet for 120 seconds (this can be changed to your liking), use:

    ./bin/pktctl --wallet walletpassphrase <passphrase you used when creating wallet> 120
To keep your wallet unlocked, use:

    ./bin/pktctl --wallet walletpassphrase <passphrase you used when creating wallet> 0
If using `0` as in the previous example to keep your wallet indefinitely unlocked, it will stay unlocked until you either restart pktwallet or run:

    ./bin/pktctl --wallet walletlock

**NOTE:** Special characters (e.g., !, #, & *) in your passphrase may be incorrectly interpreted by your shell. You may need to wrap your passphrase in quotes.

    ./bin/pktctl --wallet walletpassphrase 'suP3r_S3cReT^P@s5W0Rd!' 120

## Sending PKT

You can send PKT using the `sendtoaddress` command, but first you must unlock your wallet for sending, as shown in the previous step.

To send cjd a 10 PKT tip:

    ./bin/pktctl --wallet sendtoaddress pkt1qt8xe7dwpelngtcpsgn5nkj3pwwdm7gf3l4auax 10

### Sending PKT from Specific Address

pktwallet gives you control over which addresses are used for making a payment. This means you can
keep different PKT in your wallet separate, for example separating business transactions from personal
transactions.

**NOTE**: PKT is _not_ a "privacy coin", so transactions are still shown in the blockchain
like with Bitcoin.

Unlock wallet:

    ./bin/pktctl --wallet walletpassphrase <passphrase you used when creating wallet> 60

Send 10 PKT to "their address" from "your address":

    ./bin/pktctl --wallet sendfrom <their address> 10 '["<your address>"]'

Notice the `'["`. This is because the last argument is actually a quoted
[JSON array](https://www.w3schools.com/js/js_json_arrays.asp). This means you can use multiple
addresses as the source of a payment. For example:

    ./bin/pktctl --wallet sendfrom <their address> 10 '["<your address>", "<your other address>"]'
**Windows users require unique formatting for command prompt:**  
>`pktctl.exe --wallet sendfrom <their address> 10 [\"<your address>\"]`

### Sweeping an Address

With pktwallet, sending 0 PKT has special significance in that it will send "as much PKT as possible".
To sweep `<old address>` address into `<new address>`, you can use the following command:

    ./bin/pktctl --wallet sendfrom <new address> 0 '["<old address>"]'

**Windows:**  
>`pktctl.exe --wallet sendfrom <new address> 0 [\"<old address>\"]`

**NOTE**: Sweeping an address will send _as much PKT as possible_, which is not necessarily all PKT
in that address. You may need to sweep multiple times before the address is empty.

## Folding Coins

If you are the recipient of many transactions, such as is the case in mining, you may not be able to spend all of them at once. This is similar to someone who is paid in pennies having a difficult time using the pennies to buy a car. To solve this
issue, you can consolidate all of the coins which were paid to you by _folding_.

Folding is sweeping an address _to itself_. Just like in sweeping, you may need to run the command many times before you have completely folded. See FAQs for more detail.

For example:

    ./bin/pktctl --wallet sendfrom <address> 0 '["<address>"]'

**Windows:**  
>`pktctl.exe --wallet sendfrom <address> 0 [\"<address>\"]`

# Alternative GUI Wallets

- [Electrum for PKT](../electrum) (Windows, MacOS, Linux)

**NOTE: Electrum is not appropriate for mining. Do NOT mine into an electrum wallet!**

- [PKT World Wallet](https://www.pkt.world/wallet) (Windows)

- [Zulu Wallet](https://github.com/artrepreneur/Zulu) (MacOS)

# FAQs

## I have several machines mining, do I need the wallet running on each machine?

>NO! In fact, the wallet doesn't need to be running at all to mine, but you do need to ensure you have control of the address you are mining to.

## Should I leave pktwallet running?

>It is not a requirement to have pktwallet running to mine. However, if you leave it running, it will stay synced. This will save time when performing pktctl functions, such as folding and sending coins. If pktwallet has not been running for some time, it will need time to sync up to the current block from the time it last ran. As a safety precaution, don't forget to lock your wallet if you do keep it running.

## How often should I fold and why?

>The purpose of folding is to turn all your small payments (such as from mining) into quickly and easily spendable coins. If you are multi-pool mining and have rewards in every block, you will have roughly 1440 unconsolidated transactions per day - one for each block at a rate of ~ 1 block/min. If you do not fold these transactions, after awhile you'll have a huge amount of transactions to process if you wish to send the sum or portion thereof of these smaller transactions. So, while folding isn't required and will have no impact on mining if you do or do not, you're doing yourself a favor later by keeping the transactions as consolidated as possible. It is typical to fold as much as possible every day or every few days when you think about it, depending on your use case. It can also be scripted. Note that folding is a transaction itself. Depending on how much you have to fold, you may need to run the command many times. You also may need to wait for coins to confirm before folding more. Once the folding command fails or you see a very low number in the outputcount field from running `./bin/pktctl --wallet getaddressbalances 1 1` or on [PKT block explorer](https://explorer.pkt.cash/) under Unconsolidated Txns, you have successfully folded the best you can for that point in time.
