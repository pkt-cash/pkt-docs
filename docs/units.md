# PKT Units and Fees

As with all blockchains, every transaction of PKT is exact, however unlike other blockchains, the number of atomic
units in the PKT coin is **not** a power of 10. 

With Bitcoin there are `100,000,000` atomic units ("satoshis") per bitcoin. With PKT there are 2 to the 30th power
(`1,073,741,824`) atomic units. While this is strange number in base-10, in binary it is a perfectly even 1 followed
by thirty zeros.

The binary nature of PKT has a few caveats, for example it means sending `0.01 PKT` is actually impossible.
This is because `0.01` would corrispond to `10,737,418.24` atomic units. Since they are atomic (indivisible), this
must be rounded to the nearest whole number: `10,737,418`. When this divided by 2<sup>30</sup>, it results in
`0.009999999776482582`. Therefore, all GUI wallets and explorers adopt the following convension:

1. PKT amounts are always expressed with **two** decimal places and rounded to nearest, so `1,084,479,242` atomic
units is displayed as `1.01 PKT`.
2. If the amount is less than `1 PKT`, the amount is displayed as milli-pkt or mPKT and multiplied by `1,000`,
so `10,737,418` atomic units is displayed as `10.00 mPKT`
3. If the amount is less than `1 mPKT`, the amount is displayed as micro-pkt or μPKT and multiplied by `1,000,000`,
so `107,374` atomic units is displayed as `100.00 μPKT`.
4. If the amount is less than `1 μPKT`, the amount is displayed as nano-pkt or nPKT and multiplied by `1,000,000,000`,
so `107` atomic units is displayed as `99.64 nPKT`. A single atomic unit is displayed as `0.93 nPKT`.

While these are the convensions adopted by all GUI wallets and explorers. Exchanges and merchants may choose to forbid
transaction of amounts less than `1 PKT`, thus they need only implement #1 because they will never display an amount
of less than `1 PKT`.

## Fees

PKT uses bitcoin-like computation for determining fees. Because the blockchain has a 1 minute block time, there is
generally plenty of space for transactions in the blocks and the typical fee is the minimum: 1 atomic unit per byte
of transaction size.

The size of a transaction depends on the number of transaction inputs and outputs. The number of outputs is simply
the number of addresses you are paying, plus one more to re-route change back to yourself. The number of inputs
depends on where the coins you are sending have been sourced from. If you are mining PKT, then you may have many
tiny transactions which you need to aggregate in order to make a payment.

Currently, wallets do not create transactions with more than `1,460` inputs. This results in a transaction of just
under `100,000` bytes and thus costing right around `100,000` atomic units or `93.13 μPKT`, that is micro-pkt or
millionths of a PKT (for the largest possible transaction).

A more typical transaction size would be around `1,000` bytes and thus cost `1,000` atomic units, or `931.32 nPKT`
(billionths of 1 PKT).

In almost every case, the fees will disappear when the transaction is rounded to display the 2 decimal places.
It is possible, though vanishingly unlikely that your wallet could display `10.00 PKT` and after sending exactly
`5 PKT` your wallet displays `4.99`. This would happen if the actual amount you had was `9.555555556 PKT`,
rounded to `10.00` and after sending exactly `5 PKT`, the miniscule fee caused it to cross a rounding boundary and
become `4.555555553`.

If you wish to perform analytical accounting, it is recommended that you deal exclusively in atomic units,
represented as an int64, and only represent PKT for display purposes.