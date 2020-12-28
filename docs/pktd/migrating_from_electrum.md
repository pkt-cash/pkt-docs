# Migrating from Electrum to PKTWallet

If you have an electrum based wallet which becomes overloaded from too many transactions
(e.g. from mining directly into it), then you will need to migrate your keys to a pktwallet instance.

## Step 1: Setup pktwallet
Follow the instructions in [pktwallet](./pktwallet) to get your wallet up and running

## Step 2: Export your keys
* In Electrum, click `Wallet` -> `Private Keys` -> `Export`
  * ![electrum_export1.png](./electrum_export1.png)
* You will be prompted to enter your Electrum wallet password, then a window should appear showing your keys
  * **KEEP THESE KEYS SECRET**
  * ![electrum_export2.png](./electrum_export2.png)
* Find an address which you want to migrate and copy the key with that address
  * Do **not** copy the part which says `p2wpkh:`, just the letters after it
  * The key will look sometihng like this: `ci2TBp2HTWtyMQtizWMuugHxG6lNpInA1bSpLIWzjJS2AI8ObwV5`

## Step 3: Import key to pktwallet
* In a terminal window, run `pktctl --wallet getbalance` to verify that your wallet is working
* Unlock your wallet using `pktctl --wallet walletpassphrase <the password you used when setting it up> 1000000`
* Type `pktctl --wallet importprivkey <the key you just copied>`
* You should see the address printed on the screen

## Importing more keys
* When you import a key, it starts a rescan of the chain automatically, in order to import more you need to stop
  * `pktctl --wallet stopresync` to stop

## Speed things up
If you know exactly when an address was paid, you can speed up the import by only rescanning blocks where it
might have been paid. For example if you are sure that the address was not paid earlier than block number 600000
you can do the following:

* `pktctl --wallet stopresync`
* `pktctl --wallet resync 600000 100000000`

## Check that it's working
It's recommended that you run pktwallet with `-d debug` flag in order to be able to see the debug logs.
When you are resyncing you should see log lines like the following:

```
1609188780 [DBG] wallet.go:2817 Rescan cycle [620100]
1609188781 [DBG] wallet.go:2817 Rescan cycle [620200]
1609188782 [DBG] wallet.go:2817 Rescan cycle [620300]
1609188783 [DBG] wallet.go:2817 Rescan cycle [620400]
```

The number if the block number which is being scanned.

## Troubleshooting
* `ErrBirthdayBlockNotSet: birthday block not set`
  * Your wallet is not synced yet, wait for it to become synced
