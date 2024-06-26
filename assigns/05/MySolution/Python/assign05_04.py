########################
# HX-2024-06-14: 10 points
########################
"""
Given two words w1 and w2 of the same length,
please implement a function wordle_hint(w1, w2)
that return a sequence of pairs (i, c) for each
character c in w2 where i indicates the color
of c according to the rule of the wordle game:
0: c does not appear in w1
1: c appears in w1 at the same position as it does in w2
2: c appears in w1 at a different position as it does in w2
Please note that the number of times (1, c) or (2, c) appearing
in the returned sequence must be less than or equal to the number
of times c appearing in w1.
For instance,
w1 = water and w2 = water
wordle_hint(w1, w2) =
(1, w), (1, a), (1, t), (1, e), (1, r)
For instance,
w1 = water and w2 = waste
wordle_hint(w1, w2) =
(1, w), (1, a), (0, s), (2, t), (2, e)
For instance,
w1 = abbcc and w2 = bbccd
wordle_hint(w1, w2) =
(2, b), (1, b), (2, c), (1, c), (0, d)
"""
########################################################################
def wordle_hint(w1, w2):
    length = len(w1)
    result = [None] * length
    char_count = {}

    for char in w1:
        char_count[char] = char_count.get(char, 0) + 1

    for i in range(length):
        if w2[i] == w1[i]:
            result[i] = (1, w2[i])
            char_count[w2[i]] -= 1

    for i in range(length):
        if result[i] is None:
            if w2[i] in char_count and char_count[w2[i]] > 0:
                result[i] = (2, w2[i])
                char_count[w2[i]] -= 1
            else:
                result[i] = (0, w2[i])

    return result
########################################################################
