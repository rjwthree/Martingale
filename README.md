### Martingale

The Martingale betting system usually describes a strategy in which one doubles the bet after each loss until winning, theoretically yielding a net gain equal to the initial bet.

In a coin flipping example, one could bet on heads repeatedly until winning. Imagine you start with a bet of $10 and the coin shows tails, so you bet $20 and lose again, so you bet $40 and finally win. You lost $30 from the first two bets but the overall outcome is a gain of $10. This can be easily adapted to other games like blackjack.

But does this work in practice? In real gambling scenarios no one can escalate betting amounts forever, either because of betting ceilings imposed by the house or limits on the wealth one can marshal.

These scripts, written in Python and R, simulate a blackjack game played with a Martingale strategy. It's possible to provide answers through mathematical proof — see the optional stopping theorem — but it's far more intuitively satisfying to observe how the strategy behaves in these simulations.

The probability of winning per hand was set to 48%, which is a reasonable estimate for blackjack, although it varies depending on one's strategy and the behavior of other players. It can be easily adjusted to simulate other games.

## Results

The outcome with no betting ceiling is straightforward.
