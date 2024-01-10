# PKT Units

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