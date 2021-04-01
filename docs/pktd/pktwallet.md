# PKTWallet

The command line PKT wallet.

For an easy-to-use wallet which works on Windows, Mac and Linux, see [PKT Electrum](../electrum) instead
but **electrum is not appropriate for mining**.

## Installation and setup
### Microsoft Windows
If you are on Windows:

* Download [pktwallet.exe](https://drive.google.com/file/d/15H-kP3H7MiXS_C6no9PouoNaE7iYypUY/view?usp=sharing)
* Download [pktctl.exe](https://drive.google.com/file/d/1ixKkHavB8C9Ny8JxJwwT8nIfJ4t9dI__/view?usp=sharing)
* Open the command prompt
* Type `cd Downloads`
* Follow the instructions but
  * In place of `./bin/pktwallet`, type `pktwallet*.exe`
  * In place of `./bin/pktctl`, type `pktctl*.exe`

### MacOS and Linux
Follow the [installation](../#installation) process. Then once it is installed, you can create your wallet.

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

For more explanation of the meaning of the output of `getaddressbalances`, use:

    ./bin/pktctl --wallet help getaddressbalances

## Sending PKT
You can send someone PKT using the `sendtoaddress` command, but first you must *unlock* your
wallet for sending. In this example, we’re keeping the wallet unlocked for only 60 seconds, you can
change the number at the end to your liking.

    ./bin/pktctl --wallet walletpassphrase <password you used when creating wallet> 60

Then send cjd a 10 PKT tip:

    ./bin/pktctl --wallet sendtoaddress pkt1qt8xe7dwpelngtcpsgn5nkj3pwwdm7gf3l4auax 10

## Sending PKT privately using sendfrom
Pktwallet gives you control over which addresses are used for making a payment. This means you can
keep different PKT in your wallet separate, for example separating business transactions from personal
transactions.

**NOTE**: PKT is *not* a "privacy coin", so transactions are still shown in the blockchain
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

**NOTE**: Sweeping an address will send *as much PKT as possible* which is not necessarily all PKT
in that address, you may need to sweep multiple times before the address is empty, see Folding coins.

## Folding coins
If you are the recipient of many transactions, you may not be able to spend all of them at once, just
like someone who is paid in pennies would not be able to use their pennies to buy a car. To solve this
issue, you can aggregate all of the coins which were paid to you by *folding*.

Folding is sweeping an address *to itself*, for example:

    ./bin/pktctl --wallet sendfrom <address> 0 '["<address>"]'

You will want to fold an address down until there are fewer than 100 unspent outputs, to see the number
of unspent outputs check `outputcount` from `getaddressbalances` or go to the
[PKT block explorer](https://explorer.pkt.cash/), enter your address, and check the number of
"Unconsolidated Txns".