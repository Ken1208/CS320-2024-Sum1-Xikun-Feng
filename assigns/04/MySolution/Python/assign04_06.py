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
# def solve_N_queen_puzzle(N):
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
    # raise NotImplementedError
####################################################


def is_safe(board, row, col):
    for i in range(row):
        if board[i] == col or \
           board[i] - i == col - row or \
           board[i] + i == col + row:
            return False
    return True

def solve_n_queens_util(board, row, n, solutions):
    if row == n:
        solutions.append(tuple(board))
        return

    for col in range(n):
        if is_safe(board, row, col):
            board[row] = col
            solve_n_queens_util(board, row + 1, n, solutions)
            board[row] = -1

def solve_N_queen_puzzle(N):
    board = [-1] * N
    solutions = []
    solve_n_queens_util(board, 0, N, solutions)

    def solutions_stream(solutions):
        def generator():
            for solution in solutions:
                yield solution
        return generator

    return solutions_stream(solutions)
