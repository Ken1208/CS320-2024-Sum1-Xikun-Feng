######################################################
import sys
######################################################
sys.path.append('./../../MySolution/Python')
from assign05_04 import *
######################################################
def fword1_gen():
    while True:
        yield 'a'
        yield 'a'
        yield 'b'
        yield 'b'
def fword2_gen():
    while True:
        yield 'a'
        yield 'b'
        yield 'a'
        yield 'b'
######################################################
N = 10000000
theWord1 = []
theWord2 = []
word1_gen = fword1_gen()
word2_gen = fword2_gen()
for i in range(N):
    theWord1.append(next(word1_gen))
for i in range(N):
    theWord2.append(next(word2_gen))
######################################################
hint12 = \
wordle_hint\
("".join(theWord1), "".join(theWord2))
assert(theWord2 == [c for (_, c) in hint12])
assert(3*N == 2*sum(i for (i, _) in hint12))
######################################################
print("Assign05-04-test passed!")
######################################################

#### end of [CS320-2024-Sum1-assign05_04_test.py] ####
