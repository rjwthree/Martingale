#########################################################
############### Martingale betting system ###############
#########################################################

s <- b <- 10 # starting bet, current bet
p <- .48 # probability of winning
c <- 0 # 1 if ceiling exists, 0 if not
f <- 2 # number of losing bets required to reach the ceiling
n <- 10^7 # number of hands
u <- 10^6 # progress updates will print at multiples of this number
w <- h <- 0 # net winnings, counter
v <- s*2^f # value of the ceiling
N <- Q <- numeric(n) # all net winnings, current bets will be inserted here

hands <- sample(0:1, size = n, replace = T, prob = c(1-p, p)) # 0 for loss, 1 for win

for (i in hands) { # for each hand
  if (i == 0) { # if loss occurs
    w <- w - b # subtract current bet from net winnings
    b <- 2*b # loss triggers doubling of current bet
    if (c == 1 & b > v) { # but if doubling exceeds the ceiling
      b <- s # return current bet to starting bet
    }
  } else { # if win occurs
    w <- w + b # add current bet to net winnings
    b <- s # always return current bet to starting bet
  }
  
  h <- h + 1 # increment counter
  N[h] <- w # insert net winnings after each hand
  Q[h] <- b # insert current bet after each hand
  if (h == 1) {print(paste0('Start at ', Sys.time()), quote = F)} # print start with timestamp
  if (h %% u == 0) {print(paste0(h, ' at ', Sys.time()), quote = F)} # print updates with timestamps
}

Q <- c(s, Q[-length(Q)]) # add starting bet, remove last bet because it was not placed

print(paste0(w/n, ' per hand, on average'), quote = F)
print(paste0(min(N), ' at the nadir'), quote = F)
print(paste0('Largest bet: ', max(Q)), quote = F)



##### Expected winnings per hand #####

s <- 10 # starting bet
p <- .52 # probability of losing
c <- 0 # 1 if ceiling exists, 0 if not
f <- 2 # number of losing bets required to reach the ceiling

if (c == 0) { # no ceiling
  print(paste0(s*(1-p), ' per hand, on average'), quote = F)
} else if (c == 1) { # ceiling
  q <- r <- numeric(f+1)
  for (i in 0:f) {
    q[i+1] <- (2*p)^i
    r[i+1] <- p^i
  }
  print(paste0(s*(1-2*p)*sum(q)/sum(r), ' per hand, on average'), quote = F)
}
