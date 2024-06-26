########################
# HX-2024-06-14: 30 points
########################
"""
Given a history of wordle hints, this function returns a
word as the player's guess. THIS GUESS SHOULD NOT CONTRADICT
ANY ONE OF THE HINTS GIVEN.
"""
########################################################################

def wordle_guess(hints):
    word_length = len(hints[0])
    possible_chars = [set('abcdefghijklmnopqrstuvwxyz') for _ in range(word_length)]
    must_have_chars = {}

    def update_possible_chars(index, hint):
        i, c = hint
        if i == 1:
            possible_chars[index] = {c}
        elif i == 2:
            possible_chars[index].discard(c)
            if c in must_have_chars:
                must_have_chars[c] += 1
            else:
                must_have_chars[c] = 1
        else:
            for pos in possible_chars:
                pos.discard(c)

    def update_must_have_chars(index, hint):
        i, c = hint
        if i == 1 or i == 2:
            if c in must_have_chars:
                must_have_chars[c] += 1
            else:
                must_have_chars[c] = 1

    def construct_guess():
        guess = [''] * word_length
        for index, chars in enumerate(possible_chars):
            if len(chars) == 1:
                guess[index] = list(chars)[0]
            else:
                for c in chars:
                    if c in must_have_chars and must_have_chars[c] > 0:
                        guess[index] = c
                        must_have_chars[c] -= 1
                        break
        return ''.join(guess)

    # Update possible_chars and must_have_chars based on the hints
    int1_foreach(len(hints), lambda hint_index: int1_foreach(word_length, lambda index: update_possible_chars(index, hints[hint_index][index])))
    int1_foreach(len(hints), lambda hint_index: int1_foreach(word_length, lambda index: update_must_have_chars(index, hints[hint_index][index])))

    # Construct and return the guess
    return construct_guess()
########################################################################
