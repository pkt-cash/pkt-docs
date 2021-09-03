
# PKTWallet

The command line PKT wallet.

For an easy-to-use wallet which works on Windows, Mac and Linux, see [PKT Electrum](../electrum) instead
but **electrum is not appropriate for mining**.

## Installation and setup

### Microsoft Windows

- Download the most recent zip archive suffixed with `-windows.zip` available from  
  [pktd releases page](https://github.com/pkt-cash/pktd/releases)

For example: `pktd-v1.3.1-windows.zip`

- Go to the `Downloads` directory
- Unarchive the content of the zip file
- Open the command prompt and navigate to the bin directory in the extracted archive
- Example: `cd Downloads\pktd*\bin`
- Follow the instructions below but
	-  In place of `./bin/pktwallet`, type `pktwallet.exe`
	 - In place of `./bin/pktctl`, type `pktctl.exe`

### MacOS and Linux

- Download one of the most recent packages available for linux or macos from  
  [pktd releases page](https://github.com/pkt-cash/pktd/releases)

For example, for `pktd-v1.3.1` release:

- For **MacOS**, after having downloaded `pktd-v1.3.1-macos.pkg`,  
  install `pktwallet` and other utilities by clicking on the package icon in the Finder.

- For **Linux**, after having downloaded one of the following packages:
  - `pktd-v1.3.1-linux.deb` (Debian or Ubuntu),
  - `pktd-v1.3.1-linux.rpm` (Fedora or RedHat) or
  - [pktd AUR package](https://aur.archlinux.org/packages/pktd) (Arch linux or Manjaro),  
    install `pktwallet` and other utilities by clicking
    on the appropriate package icon or running an installation command

## Creating a wallet

To create a new PKT wallet, use the pktwallet --create command:

    ./bin/pktwallet --create

You will be prompted to follow a few steps, make sure you write your seed words on paper so that you can
recover your funds even if your computer is damaged.

## Launching pktwallet

After creating your wallet, you can launch pktwallet with:

    ./bin/pktwallet

Watch the output from the logs and when you see a log line like this:

    1608294386 [INF] headerlogger.go:64 Processed 1 block in the last 24.82s (height 702781, 2020-12-18 13:26:01 +0100 CET)

Compare the height number in the log line (e.g. 702781) to the number in
[the pkt block explorer](https://explorer.pkt.cash) to see when your wallet is up to date.

You may leave pktwallet running in the background or start it only when needed.

## Creating a new PKT address

while pktwallet is running in the background (in another terminal window), use the following command:

    ./bin/pktctl --wallet getnewaddress

You should see an a series of numbers and letters beginning with `pkt1`, this is your address which you
can use for receiving coins.

**NOTE**: Every time you use `getnewaddress`, the address you receive must be remembered by pktwallet
forever so only use it when you actually need an address.

## Getting your balance

You can check your current PKT balance using pktwallet, or you can check the balances of each of your
addresses.

    ./bin/pktctl --wallet getbalance

Or:

    ./bin/pktctl --wallet getaddressbalances

To show 0 balance addresses, use:

    ./bin/pktctl --wallet getaddressbalances 1 1

For more explanation of the meaning of the output of `getaddressbalances`, use:

    ./bin/pktctl --wallet help getaddressbalances

## Sending PKT

You can send someone PKT using the `sendtoaddress` command, but first you must _unlock_ your
wallet for sending. In this example, we’re keeping the wallet unlocked for only 60 seconds, you can
change the number at the end to your liking.

    ./bin/pktctl --wallet walletpassphrase <password you used when creating wallet> 60

Then send cjd a 10 PKT tip:

    ./bin/pktctl --wallet sendtoaddress pkt1qt8xe7dwpelngtcpsgn5nkj3pwwdm7gf3l4auax 10

## Sending PKT privately using sendfrom

Pktwallet gives you control over which addresses are used for making a payment. This means you can
keep different PKT in your wallet separate, for example separating business transactions from personal
transactions.

**NOTE**: PKT is _not_ a "privacy coin", so transactions are still shown in the blockchain
like with Bitcoin.

    ./bin/pktctl --wallet walletpassphrase <password you used when creating wallet> 60

Then send 10 PKT to "their address" from "your address".

    ./bin/pktctl --wallet sendfrom <their address> 10 '["<your address>"]'

Notice the `'["`, this is because the last argument is actually quoted
[JSON array](https://www.w3schools.com/js/js_json_arrays.asp), this means you can use multiple
addresses as the source of a payment. For example:

    ./bin/pktctl --wallet sendfrom <their address> 10 '["<your address>", "<your other address>"]'

## Sweeping an address

With pktwallet, sending 0 PKT has a special significance that it will send "as much PKT as possible".
To sweep `<old address>` address into `<new address>`, you can use the following command:

    ./bin/pktctl --wallet sendfrom <new address> 0 '["<old address>"]'

**NOTE**: Sweeping an address will send _as much PKT as possible_ which is not necessarily all PKT
in that address, you may need to sweep multiple times before the address is empty, see Folding coins.

## Folding coins

If you are the recipient of many transactions, you may not be able to spend all of them at once, just
like someone who is paid in pennies would not be able to use their pennies to buy a car. To solve this
issue, you can aggregate all of the coins which were paid to you by _folding_.

Folding is sweeping an address _to itself_, for example:

    ./bin/pktctl --wallet sendfrom <address> 0 '["<address>"]'

**Windows Users**:		

Step one: Open your wallet

In the command terminal, navigate to the folder that holds pktcl.exe and run this command.

`cd <Path to the folder that holds pktcl.exe>`

You will want to enter in your this in your command terminal:

`pktctl.exe --wallet walletpassphrase <yourwalletpassphrase> <seconds to leave open>`

<yourwalletpassphrase> = your wallet's passphrase
<seconds to leave open> = How long you want to leave your wallet open, in seconds.

Example of code:
	
`pktctl.exe --wallet walletpassphrase 1234 600`

You will know that it is working, for no errors will show. You will have a new line to enter in commands.

Step 2: Fold coins

Now you can enter in this command to fold your coins. You can do this in the same command termial that you have been using.
	
`pktctl.exe --wallet sendfrom <address> 0 [\"<address>\"]`

You will know this is working, for you will get a transaction number. You can match this transaction number up in the pkt block explorer

Or

You can put your wallet number in the [PKT block explorer](https://explorer.pkt.cash/) and search for it. You will see the Transactions table.

A Yellow circle means that the Transactions is taking place. Your balance will drop during this time.
A Green circle means that the Transactions is complete. Your balance, will return to what is what is was before the folding occured.
Noticed how your Unconsolidated Txns is lowered. This might take a few mintues for this action to happen.

You will want to fold an address down until there are fewer than 100 unspent outputs, to see the number
of unspent outputs check `outputcount` from `getaddressbalances` or go to the
[PKT block explorer](https://explorer.pkt.cash/), enter your address, and check the number of
"Unconsolidated Txns".
