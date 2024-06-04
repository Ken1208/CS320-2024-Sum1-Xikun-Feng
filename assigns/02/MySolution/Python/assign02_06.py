####################################################
import sys
sys.path.append('./../..')
from assign02_lib import *
####################################################
print("[import ./../../assign02_lib.py] is done!")
####################################################
#
# Please implement (10 points)
# mylist_quicksort (see list_quicksort in assign02-lib.sml)
#
####################################################

def mylist_append(xs, ys):
    if mylist_nilq(xs):
        return ys
    else:
        return mylist_cons(xs.get_arg1(), mylist_append(xs.get_arg2(), ys))

def qpart(xs, p0):
    if mylist_nilq(xs):
        return (mylist_nil(), mylist_nil())
    else:
        x1 = xs.get_arg1()
        ys, zs = qpart(xs.get_arg2(), p0)
        if x1 <= p0:
            return (mylist_cons(x1, ys), zs)
        else:
            return (ys, mylist_cons(x1, zs))

def qsort(xs):
    if mylist_nilq(xs):
        return mylist_nil()
    else:
        x1 = xs.get_arg1()
        ys, zs = qpart(xs.get_arg2(), x1)
        sorted_ys = qsort(ys)
        sorted_zs = qsort(zs)
        return mylist_append(sorted_ys, mylist_cons(x1, sorted_zs))

def mylist_quicksort(xs):
    return qsort(xs)