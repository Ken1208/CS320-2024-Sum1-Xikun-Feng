###########################################################################
# (* ****** ****** *)
# (*
# For encoding functional lists in Python
# *)
# (* ****** ****** *)
###########################################################################
#
# datatype 'a list =
# nil | cons of ('a * 'a list)
#
class fnlist:
    ctag = -1 #invalid
    def get_ctag(self):
        return self.ctag
# end-of-class(fnlist)
###########################################################################

class fnlist_nil(fnlist):
    def __init__(self):
        self.ctag = 0
        # return None
# end-of-class(fnlist_nil)

class fnlist_cons(fnlist):
    def __init__(self, arg1, arg2):
        self.ctag = 1
        self.arg1 = arg1
        self.arg2 = arg2
    def get_arg1(self):
        return self.arg1
    def get_arg2(self):
        return self.arg2
# end-of-class(fnlist_cons)

###########################################################################

def fnlist_sing(x0):
    return fnlist_cons(x0, fnlist_nil())

###########################################################################

def fnlist_length(xs):
    res = 0
    while(xs.ctag != 0):
        xs = xs.arg2
        res = res + 1
    return res

###########################################################################

def fnlist_print(xs):
    nx = 0
    sep = "; "
    print("fn[",end='')
    while(xs.ctag > 0):
        if (nx > 0):
            print(sep,end='')        
        print(xs.arg1,end='')
        nx = nx + 1; xs = xs.arg2
    print("]", end='')
# end-of-[fnlist_print]

###########################################################################

def fnlist_range(nx):
    res = fnlist_nil()
    for i in range(nx):
        res = fnlist_cons(nx-1-i, res)
    return res

###########################################################################

def fnlist_append(xs, ys):
    if (xs.ctag == 0):
        return ys
    else:
        return fnlist_cons(xs.arg1, fnlist_append(xs.arg2, ys))

###########################################################################

def fnlist_reverse(xs):
    return fnlist_rappend(xs, fnlist_nil())
    
def fnlist_rappend(xs, ys):
    if (xs.ctag == 0):
        return ys
    else:
        return fnlist_rappend(xs.arg2, fnlist_cons(xs.arg1, ys))

###########################################################################

xs10 = fnlist_range(10)
print("xs10 = "); fnlist_print(xs10); print()
xs10_rev = fnlist_reverse(xs10)
print("xs10_rev = "); fnlist_print(xs10_rev); print()

xs10_pal = fnlist_append(xs10, xs10_rev)
print("xs10_pal = "); fnlist_print(xs10_pal); print()

###########################################################################
