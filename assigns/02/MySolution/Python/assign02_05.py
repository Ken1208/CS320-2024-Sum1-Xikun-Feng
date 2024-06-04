####################################################
import sys
sys.path.append('./../..')
from assign02_lib import *
####################################################
print("[import ./../assign02_lib.py] is done!")
####################################################
#
# Please implement (20 points)
# mylist_append (see list_append in assign02-lib.sml)
# mylist_rappend (see list_rappend in assign02-lib.sml)
# mylist_reverse (see list_reverse in assign02-lib.sml)
#
####################################################

def mylist_append(xs, ys):
    if mylist_nilq(xs):
        return ys
    else:
        return mylist_cons(xs.get_arg1(), mylist_append(xs.get_arg2(), ys))

def mylist_rappend(xs, ys):
    if mylist_nilq(xs):
        return ys
    else:
        return mylist_rappend(xs.get_arg2(), mylist_cons(xs.get_arg1(), ys))
    
def mylist_reverse(xs):
    return mylist_rappend(xs, mylist_nil())