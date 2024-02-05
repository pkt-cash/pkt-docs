# Casting a Vote

To cast a vote, you need to install PKT-Lightning-Wallet on your computer.

```bash
git clone https://github.com/cjdelisle/PKT-Lightning-Wallet

cd PKT-Lightning-Wallet

./do
```

Then you can create a new wallet to test the voting system:

```bash

./bin/pld --create --wallet=voting_test_jan24_2024
```

Once you have created it, start pld using:

```bash

./bin/pld --wallet=voting_test
```

After it is running, open another window, navigate to the same folder, and make a new address:

```bash

./bin/pldctl wallet/address/create
```

Once you have the new address, send yourself a few PKT in order to vote with it. You can check your balance using:

```bash

./bin/pldctl wallet/address/balances
```

Before you can vote, you will first need to unlock the wallet:

```bash

./bin/pldctl unlock
```

And after you have unlocked the wallet using the password you configured earlier, you can finally cast your vote:

```bash

./bin/pldctl wallet/transaction/sendvote \
--from_address=<your wallet address> \
—-vote_for=pkt1q2yt8djdlykf2d9ukmw0q5z5tur05xm674tq6y8
```
If all goes well, you should see a transaction ID as the result, and within a few minutes you will be able to look up that transaction on any of the block explorers.

A few words of caution: If you use the CLI pktwallet, PKT-Lightning-Wallet will open your same wallet.db file and it responds the same way to the --wallet flag. PKT-Lightning-Wallet is still in development do not use it to open a large wallet yet!
