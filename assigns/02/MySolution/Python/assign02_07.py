####################################################
import sys
sys.path.append('./../..')
from assign02_lib import *
####################################################
print("[import ./../../assign02_lib.py] is done!")
####################################################
#
# Please implement (20 points)
# mylist_mergesort (see list_mergesort in assign02-lib.sml)
#
####################################################


def split(xs):
    if mylist_nilq(xs):
        return (mylist_nil(), mylist_nil())
    else:
        x1 = xs.get_arg1()
        xs_rest = xs.get_arg2()
        if mylist_nilq(xs_rest):
            return (mylist_cons(x1, mylist_nil()), mylist_nil())
        else:
            x2 = xs_rest.get_arg1()
            xs_rest_rest = xs_rest.get_arg2()
            ys, zs = split(xs_rest_rest)
            return (mylist_cons(x1, ys), mylist_cons(x2, zs))

def merge(ys, zs):
    if mylist_nilq(ys):
        return zs
    elif mylist_nilq(zs):
        return ys
    else:
        y1 = ys.get_arg1()
        ys_rest = ys.get_arg2()
        z1 = zs.get_arg1()
        zs_rest = zs.get_arg2()
        if y1 <= z1:
            return mylist_cons(y1, merge(ys_rest, mylist_cons(z1, zs_rest)))
        else:
            return mylist_cons(z1, merge(mylist_cons(y1, ys_rest), zs_rest))

def mylist_mergesort(xs):
    if mylist_nilq(xs) or mylist_nilq(xs.get_arg2()):
        return xs
    else:
        ys, zs = split(xs)
        return merge(mylist_mergesort(ys), mylist_mergesort(zs))

