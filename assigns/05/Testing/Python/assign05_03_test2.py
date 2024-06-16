####################################################
#!/usr/bin/env python3
####################################################
import sys
####################################################
sys.setrecursionlimit(16000)
####################################################
sys.path.append('./../..')
####################################################
from assign05_lib import *
####################################################
sys.path.append('./../../MySolution/Python')
from assign05_03 import *
######################################################
xs1 = generator_tabulate(2, lambda i: i)
xs2 = generator_tabulate(3, lambda i: i + 2)
xs12 = generator_merge2(xs1, xs2, lambda x1, x2: x1 <= x2)
######################################################
assert(next(xs12) == 0)
assert(next(xs12) == 1)
assert(next(xs12) == 2)
assert(next(xs12) == 3)
assert(next(xs12) == 4)
try:
    next(xs12)
except StopIteration:
    assert True
######################################################
print("Assign05-03-test2 passed!")
####################################################
