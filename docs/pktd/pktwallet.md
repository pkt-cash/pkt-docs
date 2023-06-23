
# pktwallet

The command line PKT wallet

---

# First Time Installation and Launching

## Download pktd

### Microsoft Windows

- Download the most recent zip archive suffixed with `-windows.zip` available from  
  [pktd releases page](https://github.com/pkt-cash/pktd/releases)

For example: `pktd-v1.6.1-windows.zip`

- Unarchive the content of the zip file
- Open the command prompt and navigate to the bin directory in the extracted archive
- For Example: `cd Downloads\pktd*\bin`
- Follow the instructions below but
  - In place of `./bin/pld`, use `pld.exe`
  - In place of `./bin/pldctl`, use `pldctl.exe`

### MacOS and Linux

- Download one of the most recent packages available for Linux or MacOS from  
  [pktd releases page](https://github.com/pkt-cash/pktd/releases)

For example, for `pktd-v1.6.1` release:

- For **MacOS**, after having downloaded `pktd-v1.6.1-macos.pkg`,  
  install `pktwallet` and other utilities by clicking on the package icon in the Finder.

- For **Linux**, after having downloaded one of the following packages:
  - `pktd-v1.6.1-linux.deb` (Debian or Ubuntu)
  - `pktd-v1.6.1-linux.rpm` (Fedora or RedHat)
  - [pktd AUR package](https://aur.archlinux.org/packages/pktd) (Arch linux or Manjaro),  
    install `pktwallet` and other utilities by clicking
    on the appropriate package icon or running an installation command

## Creating a New Wallet

To create a new PKT wallet, use the pld --create command:

    ./bin/pld --create

You will be prompted to follow a few steps. Make sure you write your seed words on paper so that you can
recover your funds even if your computer is damaged. Do not skip this step. You will thank yourself later. Keep it secret. Keep it safe.

## Launching pld

After creating your wallet, you can launch pld with:

    ./bin/pld

Watch the output from the logs and when you see a log line like this:

    1608294386 [INF] headerlogger.go:64 Processed 1 block in the last 24.82s (height 702781, 2020-12-18 13:26:01 +0100 CET)

Compare the height number in the log line (e.g. 702781) to the number in
[the pkt block explorer](https://explorer.pkt.cash) to see when your wallet is up to date. A complete sync from a new installation can take 12+ hours. During this time, the balance in your wallet will not be accurate and you will be unable to transact. You may, however, proceed with creating an address while syncing, as detailed below.

## Creating a New PKT Address

While pld is running in the background (or in another terminal), use the following command:

```bash
curl -X POST "Content-Type: application/json" -d '{}' http://localhost:8080/api/v1/wallet/address/create
```
or

    ./pldclt wallet/address/create


You should see a series of numbers and letters beginning with `pkt1`. This is your newly created PKT address which you can use for receiving coins. If you need to view it after creation, the address, along with the balance, can be seen in the output from running:
Note: setting *showzerobalance* to true will show all addresses, even those with a zero balance.

```bash
curl -X POST "Content-Type: application/json" -d '{ "showzerobalance": true }' http://localhost:8080/api/v1/wallet/address/balances
```
or

    ./pldctl wallet/address/balances --showzerobalance

do

        ./pldclt wallet/address/balances

in order to see only addresses with a non-zero balance.

In order to view the total balance of your wallet including all the addresses, you can use:
```bash
curl http://localhost:8080/api/v1/wallet/balance
```

**NOTE**: Every time you use `getnewaddress`, the address you receive must be remembered by pktwallet forever. So, only use it when you actually need an address.

## How to install the PKT World Wallet (Windows only)

1. Download the [PKT World Wallet](https://www.pkt.world/wallet){target=_blank}
2. Follow the installation instructions
3. Launch wallet
4. Create a new wallet
5. Enter a wallet passphrase. Make sure to save your passphrase in a safe place.
6. Write down your wallet seed. It is very important to keep your seed in a safe place
7. To generate a new PKT address, click Wallet.
8. Generate new address
9. To begin mining using the PKT World Wallet, click Miner
10. Start Mining

## How to install a CLI Wallet
If you already have a wallet created on your computer called wallet.db you will need to create a new wallet by following these steps:

1. Download [pktd-v1.6.1-macos.pkg](https://github.com/pkt-cash/pktd/releases/download/pktd-v1.6.1/pktd-v1.6.1-macos.pkg){target=_blank}
2. Run the installation
3. Open Terminal
4. Enter the command: ```$ cd pktd```
5. Enter the command: ```$ ~/pktd/bin/pld --create --wallet xxxx```    
*`xxxx` is the name of the wallet i.e. wallet personal*  
*Make sure to write this down for your notes*  
6. Enter passphrase or leave empty  
*Make sure to write this down for you notes*
7. Do NOT add additional layer of security
8. Copy down your seed. If your wallet is destroyed, you can recover it as long as you have this seed and your wallet passphrase. Please keep in mind that anyone who has access to the seed only needs to guess your wallet passphrase to access your funds.
9. Follow the instructions to finalize wallet

### How to start up CLI Wallet

1. Open terminal
2. Enter the command: ```$ cd pktd```
3. Enter the command:  
```$ ~/pktd/bin/pld --wallet xxxx```  
*(whatever you named your wallet) i.e* ```wallet personal```

### How to create new PKT wallet address

1. Make sure you have the CLI wallet running in a separate terminal window
2. Open Terminal
3. Enter command: ```$ cd pktd```
4. Enter command: ```$ ~/pktd/bin/pldctl wallet/address/create```  
*Save your address in a safe place that is easily accessible*

### How to send PKT from your CLI wallet

1. Make sure you have the CLI wallet running in a separate terminal window
2. Open terminal
3. Enter command: ```$ cd pktd```
4. Enter Command: ```$ ~/pktd/pktd/bin/pldctl wallet/transaction/sendfrom --to_address=pkt1xxxxx --amount=$$$$ '--from_address=["pkt1xxxxx"]' ```
*xxxxx = PKT address you want to send from and to*  
*$$$$ = amount of pkt you want to send*

### How to install a CLI Wallet from Seed
If you already have a wallet created on your computer called wallet.db you will need to create a new wallet by following these steps:

1. Download [pktd-v1.5.1-macos.pkg](https://github.com/pkt-cash/pktd/releases/download/pktd-v1.5.1/pktd-v1.5.1-macos.pkg){target=_blank}
2. Run the installation
3. Open Terminal
4. Enter the command: ```$ cd pktd```
5. Enter the command: ```$ ~/pktd/bin/pld --create --wallet xxxx```  
*xxxx is the name of the wallet i.e. wallet personal*  
*Make sure to write this down for your notes*
6. Enter passphrase or leave empty  
*Make sure to write this down for you notes*
7. Do NOT add additional layer of security
8. Enter seed
9. Start up wallet (see instructions above)
10. Open new terminal window
11. Enter the command: ```$ cd pktd```
12. Enter the command: ```$ ~/pktd/bin/pldctl wallet/address/create```  
*repeat until you find receive (each of) your recovered wallet address(es)*
13. Enter the command: ```$ ~/pktd/bin/pldctl wallet/address/resync```  
*This will resync the wallet to the blockchain (takes at least 24 hours)*
14. Enter the command: ```$ ~/pktd/bin/pldctl wallet/address/balances```  
*this is how you view all your (sub)wallet balances*


# Using Your Wallet

pldctl is the program that interfaces with a running pktwallet instance. pldctl functions will not work if pktwallet is not running and accessible. Some functions will be limited until pktwallet is fully synchronized. Some functions require the wallet being unlocked before executing.

## Unlocking Wallet

While many functions can be performed while the wallet is locked, other functions first require the wallet to be unlocked, including sending PKT and folding. The passphrase used to unlock the wallet was set when creating the wallet.

To keep your wallet unlocked, use:

    ./pldctl wallet/unlock --wallet_passphrase="pktdi3zkgr" --wallet_name="wallet_xxxxx.db"

*xxxx refers to the wallet name you might have defined upon creation, otherwise the default wallet name is wallet.db and to unlock this --wallet_name is not needed*

## Getting Your Balance

You can check your current PKT balance using pldctl or you can check the balances of each of your addresses if you have more than one.

    ./bin/pldctl wallet/balance

or:

    ./bin/pldctl wallet/address/balances

`wallet/address/balances` by itself will not show 0 balance addresses you may have created. To show these addresses, use:

    ./bin/pldctl wallet/address/balances --showzerobalance

For more explanation of the meaning of the output of `getaddressbalances`, use:

    ./bin/pldctl help wallet/address/balances

## Sending PKT

You can send PKT using the `sendtoaddress` command, but first you must unlock your wallet for sending, as shown in the previous step.

To send cjd a 10 PKT tip:

    ./bin/pldctl wallet/transaction/sendfrom --to_address=pkt1qt8xe7dwpelngtcpsgn5nkj3pwwdm7gf3l4auax --amount=10 '--from_address=["pkt1xxxxx"]

*pkt1xxxxx = PKT address you want to send from*    

Notice the `'["`. This is because the last argument is actually a quoted
[JSON array](https://www.w3schools.com/js/js_json_arrays.asp). This means you can use multiple
addresses as the source of a payment. For example:

    ./bin/pldctl wallet/transaction/sendfrom --to_address=pkt1xxxxx --amount=10 '--from_address=["pkt1yyyy1","pkt1yyyy2"]

*pkt1xxxx is their address, pkt1yyyy1 and pktyyyy2 is your PKT addresses to send from*

**Windows users require unique formatting for command prompt:**  
>`pldctl.exe wallet/transaction/sendfrom --to_address=<their address> --amount=10 --from_address=[\"<your address>\"]`

### Sweeping an Address

With pktwallet, sending 0 PKT has special significance in that it will send "as much PKT as possible".
To sweep `<old address>` address into `<new address>`, you can use the following command:

    ./bin/pldctl wallet/transaction/sendfrom --to_address=<new address> --amount=0 --from_address='["<old address>"]'

**Windows:**  
>`pldctl.exe wallet/transaction/sendfrom --to_address=<new address> --amount=0 --from_address=[\"<old address>\"]`

**NOTE**: Sweeping an address will send _as much PKT as possible_, which is not necessarily all PKT
in that address. You may need to sweep multiple times before the address is empty.

## Folding Coins

If you are the recipient of many transactions, such as is the case in mining, you may not be able to spend all of them at once. This is similar to someone who is paid in pennies having a difficult time using the pennies to buy a car. To solve this
issue, you can consolidate all of the coins which were paid to you by _folding_.

Folding is sweeping an address _to itself_. Just like in sweeping, you may need to run the command many times before you have completely folded. See FAQs for more detail.

For example:

    ./bin/pldctl wallet/transaction/sendfrom --to_address=<address> --amount=0 --from_address='["<address>"]'


**Windows:**  
>`pldctl.exe wallet/transaction/sendfrom --to_address=<address> --amount=0 --from_address=[\"<address>\"]`

# Alternative GUI Wallets

- [Electrum for PKT](../electrum) (Windows, MacOS, Linux)

**NOTE: Electrum is not appropriate for mining. Do NOT mine into an electrum wallet!**

- [PKT World Wallet](https://www.pkt.world/wallet) (Windows)

- [Zulu Wallet](https://github.com/artrepreneur/Zulu) (MacOS)

# FAQs

## I have several machines mining, do I need the wallet running on each machine?

>NO! In fact, the wallet doesn't need to be running at all to mine, but you do need to ensure you have control of the address you are mining to.

## Should I leave pktwallet running?

>It is not a requirement to have pktwallet running to mine. However, if you leave it running, it will stay synced. This will save time when performing pldctl functions, such as folding and sending coins. If pktwallet has not been running for some time, it will need time to sync up to the current block from the time it last ran. As a safety precaution, don't forget to lock your wallet if you do keep it running.

## How often should I fold and why?

>The purpose of folding is to turn all your small payments (such as from mining) into quickly and easily spendable coins. If you are multi-pool mining and have rewards in every block, you will have roughly 1440 unconsolidated transactions per day - one for each block at a rate of ~ 1 block/min. If you do not fold these transactions, after awhile you'll have a huge amount of transactions to process if you wish to send the sum or portion thereof of these smaller transactions. So, while folding isn't required and will have no impact on mining if you do or do not, you're doing yourself a favor later by keeping the transactions as consolidated as possible. It is typical to fold as much as possible every day or every few days when you think about it, depending on your use case. It can also be scripted. Note that folding is a transaction itself. Depending on how much you have to fold, you may need to run the command many times. You also may need to wait for coins to confirm before folding more. Once the folding command fails or you see a very low number in the outputcount field from running `./bin/pldctl wallet/address/balances` or on [PKT block explorer](https://explorer.pkt.cash/) under Unconsolidated Txns, you have successfully folded the best you can for that point in time.
