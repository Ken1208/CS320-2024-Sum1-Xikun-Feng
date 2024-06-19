####################################################
#!/usr/bin/env python3
####################################################
import sys
sys.path.append('./../..')
####################################################
from assign04_lib import *
####################################################
#
# HX-2024-06-01: 10 points
# Please *translate* into Python the SML solution
# to word_neighbors (which is the one for Assign03-02)
#

def word_neighbors(word):
    size = len(word)

    neighbors = int1_foldleft(size, fnlist_nil(), lambda r0, x0: fnlist_append(
        int1_foldleft(26, fnlist_nil(), lambda r1, x1: fnlist_cons(
            string_make_fnlist(string_imap_fnlist(word, lambda i, x: chr(ord('a') + x1) if i == x0 else x)), r1)), r0))

    result = fnlist_filter_pylist(fnlist_make_pylist(fnlist_pylistize(neighbors)), lambda x: x != word)
    final_result = pylist_fnlistize(result)

    return final_result

#
####################################################
