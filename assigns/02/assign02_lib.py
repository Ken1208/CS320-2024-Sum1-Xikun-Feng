####################################################
# (*
# Assign01: FP in Python
# *)
####################################################

# datatype 'a list =
# nil | cons of ('a * 'a list)

class mylist:
    ctag = -1
    def get_ctag(self):
        return self.ctag
# end-of-class(mylist)

class mylist_nil(mylist):
    def __init__(self):
        self.ctag = 0
        return None
# end-of-class(mylist_nil)

class mylist_cons(mylist):
    def __init__(self, arg1, arg2):
        self.ctag = 1
        self.arg1 = arg1
        self.arg2 = arg2
        return None
    def get_arg1(self):
        return self.arg1
    def get_arg2(self):
        return self.arg2
# end-of-class(mylist_cons)

####################################################

def mylist_nilq(xs):
    return (xs.ctag == 0)
def mylist_consq(xs):
    return (xs.ctag == 1)

####################################################

def mylist_size(xs):
    res = 0
    while(xs.ctag > 0):
        res += 1
        xs = xs.arg2
    return res

####################################################

def mylist_print(xs):
    sep = ";"
    def auxlst(xs, n0):
        if (xs.ctag > 0):
            if (n0 > 0): print(sep,end='')
            print(xs.arg1,end=''); auxlst(xs.arg2, n0+1)
    print("my(", end=''); auxlst(xs, 0); print(")", end='')
# end-of-[mylist_print]

####################################################

def mylist_make_list(xs):
    res = mylist_nil()
    for x1 in reversed(xs):
        res = mylist_cons(x1, res)
    return res
# end-of-[mylist_make_list]

####################################################

xs = [1,2,3,4,5]
ys = mylist_make_list(xs)
print("ys = ",end=''); mylist_print(ys); print();

####################################################

###### end of [CS320-2024-Sum1-assign02_lib.pyt] ######
