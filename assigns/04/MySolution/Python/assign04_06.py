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
def nqueen(board):
    count = 0
    for queen in board:
        if queen <= 0:
            break
        count += 1
    return count

def set_board(board, row, col):
    board_list = list(board)
    board_list[row] = col
    return tuple(board_list)

def poss_checker(board, row, col):
    def is_safe(k):
        pk = board[k]
        return pk != col and abs(row - k) != abs(col - pk)
    return int1_forall(row, is_safe)

def board_safety_all(board):
    return int1_forall(nqueen(board), lambda row: board_safety_one(board, row))

def board_safety_one(board, row):
    def is_safe(col):
        pi = board[row]
        pj = board[col]
        return pi != pj and abs(row - col) != abs(pi - pj)
    return int1_forall(row, is_safe)

def children(node, size, stack):
    current_nqueen = nqueen(node)
    def add_child(col):
        if poss_checker(node, current_nqueen, col):
            new_board = set_board(node, current_nqueen, col)
            stack.append(new_board)
    int1_foreach(size + 1, lambda col: () if col == 0 else add_child(col))
    return None

def gtree_dfs(stack, fchildren, size):
    def dfs(stack):
        if not stack:
            return strcon_nil()
        else:
            current = stack.pop()
            fchildren(current, size, stack)
            return strcon_cons(current, lambda: dfs(stack))
    return lambda: dfs(stack)

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
    return stream_make_filter(gtree_dfs(initial_stack, children, N), lambda board: nqueen(board) == N)
####################################################
