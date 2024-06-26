####################################################
#!/usr/bin/env python3
####################################################
import sys
sys.path.append('./../..')
####################################################
from assign04_lib import *
####################################################
"""
//
HX-2024-06-01: 20 points
Solving the N-queen puzzle
Here is an implementation of the famous 8-queen puzzle:
https://ats-lang.sourceforge.net/DOCUMENT/INT2PROGINATS/HTML/x631.html
//
"""
####################################################

def set_board(bd, i0, j0):
    lst = list(bd)
    lst[i0] = j0
    return tuple(lst)

def nqueen(bd):
    res = 0
    for j0 in bd:
        if j0 <= 0:
            break
        else:
            res = res + 1
    return res

def poss_checker(bd, i0, j0):
    def helper(k0):
        pk = bd[k0]
        return pk != j0 and abs(i0 - k0) != abs(j0 - pk)
    return int1_forall(i0, helper)

def board_safety_one(bd, i0):
    def helper(j0):
        pi = bd[i0]
        pj = bd[j0]
        return pi != pj and abs(i0 - j0) != abs(pi - pj)
    return int1_forall(i0, helper)

def board_safety_all(bd):
    return int1_forall(nqueen(bd), lambda i0: board_safety_one(bd, i0))

def children(node, size, stack):
    nqueen_curr = nqueen(node)
    def helper(j):
        if poss_checker(node, nqueen_curr, j):
            temp_bd = set_board(node, nqueen_curr, j)
            stack.append(temp_bd)
    int1_foreach(size + 1, lambda i: () if i == 0 else helper(i))
    return None

def gtree_dfs(stack, fchildren, size):
    def helper(stack):
        if not stack:
            return strcon_nil()
        else:
            curr = stack.pop()
            fchildren(curr, size, stack)
            return strcon_cons(curr, lambda: helper(stack))
    return lambda: helper(stack)

def solve_N_queen_puzzle(N):
    """
    ######
    A board of size N is a tuple of length N.
    ######
    For instance, a tuple (0, 0, 0, 0) stands
    for a board of size 4 (that is, a 4x4 board)
    where there are no queen pieces on the board.
    ######
    For instance, a tuple (2, 1, 0, 0) stands
    for a board of size 4 (that is, a 4x4 board)
    where there are two queen pieces; the queen piece
    on the 1st row is on the 2nd column; the queen piece
    on the 2nd row is on the 1st column; the last two rows
    contain no queen pieces.
    ######
    This function [solve_N_queen_puzzle] should return
    a stream of ALL the boards of size N that contain N
    queen pieces (one on each row and on each column) such
    that no queen piece on the board can catch any other ones
    on the same board.
    """
    initial_stack = [(0,) * N]
    return stream_make_filter(gtree_dfs(initial_stack, children, N), lambda bd: nqueen(bd) == N)

####################################################
