# Martingale

[Here's some googling to do](https://google.com). This text is next.

The Martingale betting system usually describes a strategy in which one doubles the bet after each loss until winning, theoretically yielding a net gain equal to the initial bet.

In a coin flipping example, one could bet on heads repeatedly until winning. Imagine you start with a bet of $10 and the coin shows tails, so you bet $20 and lose again, so you bet $40 and finally win. You lost $30 from the first two bets but the overall outcome is a gain of $10. This can be easily adapted to other games like blackjack.

But does this work in practice? In real gambling scenarios no one can escalate betting amounts forever, either due to betting ceilings imposed by the house or limits on the wealth one can marshal.

These scripts, written in Python and R, simulate a blackjack game played with a Martingale strategy. It's possible to provide answers through mathematical proof — see the optional stopping theorem https://bit.ly/3hyoGeS — but it's far more intuitively satisfying to observe how the strategy behaves in these simulations.

The probability of winning per hand was set to 48%, which is a reasonable estimate for blackjack, although it varies depending on one's strategy and the behavior of other players. It can be easily adjusted to simulate other games.

## Results

The outcome with no betting ceiling is straightforward. Given a starting bet 's' and probability of winning 'p', the average gain per hand is s*p.

The script sets s to $10 and p to .48, so the average win per hand is $4.80. Even a terrible blackjack player who wins only 40% of hands would win $4.00 per hand on average. The Martingale system is a long-run winning strategy when there is no betting ceiling.

But in reality, there is always a ceiling. It's possible to succeed for long stretches, but the simulation demonstrates that any ceiling causes the Martingale system to become a loser in the long run. Eventually a series of losses will cause you to keep doubling your money until you reach the ceiling. Regardless of why the ceiling exists — a house limit or finite wealth — your inability to recoup your losses by doubling bets indefinitely until you win means that this strategy will lose any game where p < 50%.

Higher ceilings lead to greater average losses, because bumping up against the ceiling leads to exponentially larger losses whereas recovering still yields only $10 (the starting bet) each time. Recovery occurring more often does not compensate for the greater losses. The total picture might be surprising: losses grow with higher ceilings, until the cap is removed altogether and instead of losing more, you start winning!

## Visualization

The plots display what I meant by the deep intuition derived from simulations. Two examples show typical trajectories of 10,000 blackjack hands played using the Martingale system with no ceiling, resulting in a net gain of about $48,000 accompanied by occasional losses of thousands or tens of thousands of dollars. Recovering these amounts through doubling would require bets that would exceed the table limits at most casinos.

Three further examples show trajectories using a low, moderate, or high ceiling — specifically 2, 6, or 9 opportunities to double bets, respectively. With the low ceiling of $40, there are frequent periods of minor success but an average of about 70 cents per hand is lost in the long run. The moderate ceiling of $640 produces an average loss of about $1.54 per hand, and the high ceiling of $5,120 loses an average of about $2.31 per hand.

Whereas the trend for low ceilings is jagged, higher ceilings lead to longer winning streaks in which losses are consistently recovered and converted to a small gain. And because losses are larger and scarcer with higher ceilings, the outcome when stopped at a random point is more variable. The high ceiling trends are so diverse that it is impossible to select a single typical trajectory.
