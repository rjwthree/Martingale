# Martingale

The Martingale betting system usually describes a strategy in which one doubles the bet after each loss until winning, theoretically yielding a net gain equal to the initial bet.

In a coin flipping example, one could bet on heads repeatedly until winning. Imagine you start with a bet of $10 and the coin shows tails, so you bet $20 and lose again, so you bet $40 and finally win. You lost $30 from the first two bets but the overall outcome is a gain of $10. This can be easily adapted to other games like blackjack.

But does this work in practice? In real gambling scenarios no one can escalate betting amounts forever, either due to betting ceilings imposed by the house or limits on the wealth one can marshal.

These scripts, written in Python and R, simulate a blackjack game played with a Martingale strategy. It's possible to provide answers through mathematical proof — see the optional stopping theorem — but it's far more intuitively satisfying to observe how the strategy behaves in these simulations.

The probability of winning per hand was set to 48%, which is a reasonable estimate for blackjack, although it varies depending on one's strategy and the behavior of other players. It can be easily adjusted to simulate other games.

## Results

The outcome with no betting ceiling is straightforward. Given a starting bet 's' and probability of winning 'p', the average gain per hand is s*p.

The script sets s to $10 and p to .48, so the average win per hand is $4.80. Even a terrible blackjack player who wins only 40% of hands would win $4.00 per hand on average. The Martingale system is a long-run winning strategy when there is no betting ceiling.

But in reality, there is always a ceiling. It's possible to succeed for a long time given a high ceiling, but the simulation demonstrates that any ceiling causes the Martingale system to become a loser in the long run. No matter how much money you have, eventually a string of bad luck will arrive and cause you to keep doubling your money until you reach the ceiling. Regardless of why the ceiling exists — a house limit or finite wealth — your inability to recoup your losses by doubling the bet indefinitely until you win means that this strategy will lose any game where p < 50%.

## Visualization
