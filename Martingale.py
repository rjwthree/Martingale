import random as rm
import datetime as dt
import numpy as np

w = count = 0 # net winnings, counter
s = b = 10 # starting bet, current bet
c = 0 # 1 if ceiling exists, 0 if not
f = s*2**5 # s*2**_, where _ is the number of times s is doubled before reaching the ceiling
n = 10**7 # number of hands
u = 10**6 # progress updates will print at multiples of this number
p = 48 # probability of winning (%)
N = [] # all net winnings will be appended here
Q = [b] # all current bets will be appended here

print(f'Generating {n} random integers...')
hands = [rm.randint(1,100) for i in range(n)] # generate n random integers between 1 and 100

for i in hands: # for each hand
    if i > p: # if loss occurs
        w -= b # subtract current bet from net winnings
        b *= 2 # loss triggers doubling of current bet
        if c == 1 and b > f*s: # but if doubling exceeds the ceiling
            b = s # return current bet to starting bet
    else: # if win occurs
        w += b # add current bet to net winnings
        b = s # always return current bet to starting bet after winning
    N.append(w) # append net winnings after each hand
    Q.append(b) # append current bet after each hand
    count += 1 # increment counter
    if count == 1: # print start with timestamp
        print('Start at ' + dt.datetime.now().strftime('%H:%M:%S %Y-%m-%d'))
    if count % u == 0: # print updates with timestamps
        print(str(count) + ' at ' + dt.datetime.now().strftime('%H:%M:%S %Y-%m-%d'))
    
Q.pop() # remove last bet because it was not placed

print(str(w/n) + ' per hand, on average')
print(str(min(N)) + ' at the nadir')
print(str(max(Q)) + ' largest bet')
