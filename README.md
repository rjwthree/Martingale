# Martingale betting

The Martingale betting system usually describes a strategy in which one doubles the bet after each loss until winning, theoretically yielding a net gain equal to the initial bet.

In a coin flipping example, one could bet on heads repeatedly until winning. Imagine you start with a bet of $10 and the coin shows tails, so you bet $20 and lose again, so you bet $40 and finally win. You lost $30 from the first two bets but the overall outcome is a gain of $10. This can be easily adapted to other games like blackjack.

But does this work in practice? In real gambling scenarios no one can escalate betting amounts forever, either due to betting ceilings imposed by the house or limits on the wealth one can marshal.

These scripts, written in [Python](https://github.com/rjwthree/Martingale/blob/master/Martingale.py) and [R](https://github.com/rjwthree/Martingale/blob/master/Martingale.R), simulate a blackjack game played with a Martingale strategy. It's possible to provide answers through mathematical proof — see the [optional stopping theorem](https://math.uchicago.edu/~may/REU2019/REUPapers/Davidovsky.pdf) — but it's far more intuitively satisfying to observe how the strategy behaves in these simulations.

The probability of winning per hand was set to 48%, which is a reasonable estimate for blackjack, although it varies depending on one's strategy and the behavior of other players. It can be easily adjusted to simulate other games.

## Results

For the math behind the upcoming statements, see the PDF with [all the little details](https://github.com/rjwthree/Martingale/blob/master/little%20details.pdf), which corroborates the simulation results in far more accessible terms than any other resource I can find.

The outcome with no betting ceiling is straightforward. Given a starting bet 's' and probability of winning 'p', the average gain per hand is s*p. Why? No matter how many losing bets are placed, the winning bet at the end of each losing streak yields a net profit equal to the starting bet. So naturally, the expected value per bet is the starting bet divided by the average number of bets needed to win. If p were .25, a win would occur once in four hands on average, so the long-run value per hand would be the starting bet divided by four. The script sets s to $10 and p to .48, so the average win per hand is $4.80. Even a terrible blackjack player who wins only 40% of hands would win $4.00 per hand on average. The Martingale system is a long-run winning strategy when there is no betting ceiling.

But in reality, there is always a ceiling. It's possible to succeed for long stretches, but the simulation demonstrates that any ceiling causes the Martingale system to become a loser in the long run. Eventually a series of losses will cause you to keep doubling your money until you reach the ceiling. Regardless of why the ceiling exists — a house limit or finite wealth — your inability to recoup your losses by doubling bets indefinitely until you win means that this strategy will lose any game with unfavorable odds.

Higher ceilings lead to greater average losses, because bumping up against the ceiling leads to exponentially larger losses whereas recovering still yields only $10 (the starting bet) each time. Recovery occurring more often does not compensate for the greater losses. The total picture might be surprising: losses grow with higher ceilings, until the cap is removed altogether and instead of losing more, you start winning!

## Visualization

The plots are what give these simulations their intuitive value. [Two](https://raw.githubusercontent.com/rjwthree/Martingale/master/Martingale%20no%20ceiling%20ex%201.png) [examples](https://raw.githubusercontent.com/rjwthree/Martingale/master/Martingale%20no%20ceiling%20ex%202.png) show typical trajectories of 10,000 blackjack hands played using the Martingale system with no ceiling, resulting in a net gain of about $48,000 accompanied by occasional losses of thousands or tens of thousands of dollars. Recovering these amounts through doubling would require bets that exceed the table limits at most casinos.

<p align="center">
<img src="https://github.com/rjwthree/Martingale/blob/master/Martingale%20no%20ceiling%20ex%201.png" width="636" height="450"/>
</p>

Three further examples show trajectories using a [low](https://raw.githubusercontent.com/rjwthree/Martingale/master/Martingale%20ceiling%20ex%201%20-%20low.png), [moderate](https://raw.githubusercontent.com/rjwthree/Martingale/master/Martingale%20ceiling%20ex%202%20-%20moderate.png), or [high](https://raw.githubusercontent.com/rjwthree/Martingale/master/Martingale%20ceiling%20ex%203%20-%20high.png) ceiling — specifically 2, 6, or 9 opportunities to double bets, respectively. Whereas the trend for low ceilings is jagged, higher ceilings generate longer winning streaks in which losses are consistently recovered and converted to a small gain. And because losses are larger and scarcer with higher ceilings, the outcome when stopped at a random point is more variable. The high ceiling trends are so diverse that it is impossible to select a single typical trajectory.

<p align="center">
<img src="https://github.com/rjwthree/Martingale/blob/master/Martingale%20ceiling%20ex%201%20-%20low.png" width="636" height="450"/>
</p>

With the [low](https://raw.githubusercontent.com/rjwthree/Martingale/master/Martingale%20ceiling%20ex%201%20-%20low.png) ceiling of $40, there are frequent periods of minor success but an average of about 70 cents per hand is lost in the long run. The [moderate](https://raw.githubusercontent.com/rjwthree/Martingale/master/Martingale%20ceiling%20ex%202%20-%20moderate.png) ceiling of $640 produces an average loss of about $1.53 per hand, and the [high](https://raw.githubusercontent.com/rjwthree/Martingale/master/Martingale%20ceiling%20ex%203%20-%20high.png) ceiling of $5,120 loses an average of about $2.31 per hand. See [here](https://github.com/rjwthree/Martingale/blob/master/little%20details.pdf) for the formula that computes these expected values. The formula is also implemented in the [R](https://github.com/rjwthree/Martingale/blob/master/Martingale.R#L44) and [Python](https://github.com/rjwthree/Martingale/blob/master/Martingale.py#L47) scripts below the main section of code.
