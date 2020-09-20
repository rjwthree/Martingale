#########################################################
############### Martingale betting system ###############
#########################################################

import random as rm
import datetime as dt

s = b = 10 # starting bet, current bet
p = .48 # probability of winning
c = 0 # 1 if ceiling exists, 0 if not
f = 2 # number of losing bets required to reach the ceiling
n = 10**7 # number of hands
u = 10**6 # progress updates will print at multiples of this number
w = h = 0 # net winnings, counter
v = s*2**f # value of the ceiling
N = []; Q = [] # all net winnings, current bets will be appended here

print(f'Generating {n} random integers...')
hands = [rm.randint(1,100) for i in range(n)] # generate n random integers between 1 and 100

for i in hands: # for each hand
    if i > p*100: # if loss occurs
        w -= b # subtract current bet from net winnings
        b *= 2 # loss triggers doubling of current bet
        if c == 1 and b > v: # but if doubling exceeds the ceiling
            b = s # return current bet to starting bet
    else: # if win occurs
        w += b # add current bet to net winnings
        b = s # always return current bet to starting bet
        
    N.append(w) # append net winnings after each hand
    Q.append(b) # append current bet after each hand
    
    h += 1 # increment counter
    if h == 1: # print start with timestamp
        print('Start at ' + dt.datetime.now().strftime('%H:%M:%S %Y-%m-%d'))
    if h % u == 0: # print updates with timestamps
        print(str(h) + ' at ' + dt.datetime.now().strftime('%H:%M:%S %Y-%m-%d'))
    
Q = [s] + Q[:-1] # add starting bet, remove last bet because it was not placed

print(str(w/n) + ' per hand, on average')
print(str(min(N)) + ' at the nadir')
print('Largest bet: ' + str(max(Q)))



##### Expected winnings per hand #####

s = 10 # starting bet
p = .48 # probability of winning
c = 0 # 1 if ceiling exists, 0 if not
f = 2 # number of losing bets required to reach the ceiling

if c == 0: # no ceiling
    print(str(s*p) + ' per hand, on average')
elif c == 1: # ceiling
    q = []; r = []
    for i in range(f+1):
        q.append((2*(1-p))**i)
        r.append((1-p)**i)
    print(str(s*(2*p-1)*sum(q)/sum(r)) + ' per hand, on average')
