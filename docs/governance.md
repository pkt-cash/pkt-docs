# Introduction

The institution of the Network Steward will remain as it was before, and will continue to be elected via a weekly vote using the Electorium algorithm. However unlike the vote in legacy PKT, coins will need to be locked up in order to vote.

There will be no specific lockup period required, and there will be no vote multiplier for using a longer lockup period, but each PKT, and each 1 PKT worth of locked up LP Token, will be worth one vote.

The same voting mechanism will allow changes to both the Network Steward and the Executor. However, changing the Executor is a more solemn matter and so will only occur when 75% of all actively voting coins continually approve such change for 4 consecutive weeks. This 75% rule is borrowed from the requirement for approving changes to the US Constitution.

The allocation of yields is however a more complex affair, and just as the mining pools had centrally decided the allocation of yields, the application of the rules laid out in the Infrastructure section will be managed by a centralized “Executor”.

## How Does Electorium Work?

Nobody ever sits down and asks themselves who is most fit to manage the affairs of the nation. Instead people argue over whether it’s going to be the blue guy or the red guy, and they think that’s democracy. It’s quite possible that the entire partisan landscape as we know it is an artifact of a flawed voting system.

The dream of the third party candidate is that if enough people would vote for him, he would no longer be “third party”. But to get there, he needs to somehow overcome the objection that voting for him means losing a chance to vote against "The Bad Guy". Even the third party candidate does not ask the voter who is most fit to rule!

If we could just cast all the politics and partisanship aside and get to the real heart of the question, everybody’s answer would probably be different. We’d most likely have a beautiful patchwork of nominations including businessmen, professors, soldiers, clergy, and other people of distinction.

To address this, PKT uses a new vote counting algorithm called Electorium. It is in essence a search algorithm. It finds the candidate who cannot be beaten by anyone else, if we were to pretend that neither they, nor their challenger, voted for each other. So in the case of Alice and Bob, we pretend Alice is not voting for Bob, and Bob is not voting for Alice and we can easily find the winner.

This computation of delegated votes is not as simple as it might seem. If Alice votes for Bob, and Bob votes for Alice, it is not immediately obvious who should win. Not only that, it is important that the counting process be fast.

There is also another case where perhaps Alice votes for Bob, but Bob does not vote for Alice. It might seem that Bob is the clear winner, but if the majority of his votes have been received from or through Alice, then by these rules Alice still wins. However, if there is another candidate who receives more votes than Alice but less than Bob, Bob becomes the winner because Alice loses and is forced to delegate her votes.

## Delegated Voting

Using Electorium you can vote for anyone, but no one is required to be a candidate. If you vote for someone who does not wish to be a candidate, your vote is simply delegated to whoever they vote for.

Everyone who chooses to be a candidate automatically votes for themselves. If they vote for someone else, that vote is secondary to their implied vote for themselves. To put it differently, voting as a candidate will never cause you to lose. If a candidate explicitly votes for himself, his explicit vote is meaningless. It is the same as indicating his candidacy without voting at all.

This voting system values each vote by the amount of PKT the voter holds. This is of course unlike a standard national election where every citizen gets an equal vote. But like almost all blockchains, PKT has nothing analogous to the concept of the citizen.

One person can trivially pretend to be thousands, or even millions, of unique individuals. So PKT must by necessity adopt the model used in public corporations, where votes are weighted based on how much of the coin is held.

This idea of weighting the vote based on skin in the game actually makes some sense as well. In a national election, every citizen could be considered to have the equal skin in the game, it is their life and family that is at stake. But in the case of a project or online community, a person with little investment can easily walk away, so they cannot be expected to make decisions with the same level of care as someone whose involvement is greater. Thus voting is done as proof-of-stake.

Proof-of-stake voting is done publicly. The right to vote one’s conscience without fear of repercussion is a fundamental part of the modern democratic process. But anonymous voting on a blockchain is largely uncharted territory, so it is not clear how, or even if, this could be achieved.

In any case, there is one advantage to public voting, and that is public voting of the delegates. When you choose who is to represent you, you certainly should know what decisions they make. You might wonder what happens if you want to vote for somebody, but you don’t like who they would vote for. Well you can’t have it both ways, either you trust their judgment or you don’t, and the beauty of this system is that it forces you to reconcile that.

You also don’t get to evade moral responsibility by choosing a lovable candidate who's guaranteed to lose. The question before you is who is most fit to lead, and you cannot vote without answering it. If you do vote, it is highly likely that your vote will somehow help elect the final winner.

Secret voting, while important for the general public, is abhorrent when done in the senate chamber. In the Electorium system everyone is a potential senator, and everyone’s vote is a matter of public record.

You only need to vote once, and your vote counts in every election with whatever balance you have at the time of the election, until you either change it, or it expires. There is a vote expiration time of 1 year so that lost wallets will not affect the outcome of elections forever.

## Executor
From launch day, the Executor will be hard coded. 

The role of the executor is not to make meaningful decisions, but rather to fit the facts to the written rules as best as possible. Questions like “is this cjdns node really operational?” or “is that nameserver censoring domains?” are not conducive to smart contract based validation, so these decisions will be made by the Executor.

Prior to the end of 2024, a smart contract that will be developed will be an implementation of the Electorium voting algorithm to allow for replacement of the Executor.