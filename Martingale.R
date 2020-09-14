s <- b <- 10 # starting bet, current bet
p <- 48 # probability of winning (%)
c <- 0 # 1 if ceiling exists, 0 if not
f <- 5 # number of losing bets required to reach the ceiling
n <- 10^7 # number of hands
u <- 10^6 # progress updates will print at multiples of this number
w <- count <- 0 # net winnings, counter
v <- s*2^f # value of the ceiling
N <- Q <- numeric(n) # all net winnings, current bets will be inserted here

hands <- sample(1:100, size = n, replace = T) # generate n random integers between 1 and 100

for (i in hands) { # for each hand
  if (i > p) { # if loss occurs
    w <- w - b # subtract current bet from net winnings
    b <- 2*b # loss triggers doubling of current bet
    if (c == 1 & b > v) { # but if doubling exceeds the ceiling
      b <- s # return current bet to starting bet
    }
  } else { # if win occurs
    w <- w + b # add current bet to net winnings
    b <- s # always return current bet to starting bet
  }
  
  N[i] <- w # insert net winnings after each hand
  Q[i] <- b # insert current bet after each hand
  
  count <- count + 1 # increment counter
  if (count == 1) {print(paste0('Start at ', Sys.time()), quote = F)} # print start with timestamp
  if (count %% u == 0) {print(paste0(count, ' at ', Sys.time()), quote = F)} # print updates with timestamps
}

Q <- c(s, Q[-length(Q)]) # add starting bet, remove last bet because it was not placed

print(paste0(w/n, ' per hand, on average'), quote = F)
print(paste0(min(N), ' at the nadir'), quote = F)
print(paste0('Largest bet: ', max(Q)), quote = F)
