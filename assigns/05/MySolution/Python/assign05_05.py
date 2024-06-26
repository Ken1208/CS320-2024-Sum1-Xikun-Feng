########################
# HX-2024-06-14: 30 points
########################
"""
Given a history of wordle hints, this function returns a
word as the player's guess. THIS GUESS SHOULD NOT CONTRADICT
ANY ONE OF THE HINTS GIVEN.
"""
########################################################################
def updating_word(word, hints, counts, earlier_word):
    if word == earlier_word:
        return (word, hints)
    if None not in word:
        return word

    updating = word[:]
    updating_hint = hints
    updating_counts = counts
    for key in updating_hint:
        if len(hints[key]) == 1 and key in counts:
            position = list(updating_hint[key])[0]
            word[position] = key
            updating_counts[key] -= 1

    x = []
    for i in range(len(word)):
        if word[i] is not None:
            x += [i]

    for key in updating_hint:
        for i in range(len(word)):
            if i in x:
                updating_hint[key].discard(i)

    for key in updating_counts:
        if updating_counts[key] == 0 and key in updating_hint:
            del updating_hint[key]

    return updating_word(word, updating_hint, updating_counts, updating)

def sum_of_must(max_count):
    res = 0
    for key in max_count:
        res += max_count[key]
    return res == 0

def guess_word(elements, max_count, must_contain, word, length):
    # If all counts in max_count are zero and there are None values in word
    if all(count == 0 for count in max_count.values()) and None in word and sum_of_must(max_count):
        new_elem = elements[length:]

        for i in range(len(word)):
            if word[i] is None:
                for character in new_elem:
                    if (character not in must_contain or i in must_contain[character]):
                        word[i] = character
                        del character
                        break
        return word, max_count

    if None not in word:
        return word, max_count

    for i in range(len(word)):
        if word[i] is None:
            for key, value in must_contain.items():

                if i in value and key in max_count and max_count[key] > 0:

                    word[i] = key
                    max_count[key] -= 1

                    word_sol, max_count_sol = guess_word(elements, max_count, must_contain, word, length)

                    if all(count == 0 for count in max_count_sol.values()) and None not in word:
                        return word_sol, max_count_sol

                    word[i] = None
                    max_count[key] += 1

    return word, max_count

def wordle_guess(hints):
    word_length = len(hints[0])
    not_in_word = set()
    must_contain = {}
    must_be_at = [None] * word_length
    max_counts = {}
    backup = {}
    for sublist in hints:
        char_count = {}
        for hint_type, char in sublist:
            if hint_type > 0:
                if char in char_count:
                    char_count[char] += 1
                else:
                    char_count[char] = 1

        for char, count in char_count.items():
            if char in max_counts:
                max_counts[char] = max(max_counts[char], count)
            else:
                max_counts[char] = count


    for hint in hints:
        for pos, (hint_type, letter) in enumerate(hint):
            if hint_type == 0:
                not_in_word.add(letter)
                if letter not in backup:
                    backup[letter] = set()
                backup[letter].add(pos)
            elif hint_type == 2:
                if letter not in must_contain:
                    must_contain[letter] = set()
                if letter in not_in_word:
                    not_in_word.remove(letter)
                must_contain[letter].add(pos)
            elif hint_type == 1:
                must_be_at[pos] = letter

    word = [None] * word_length
    remaining_letters = [chr(i) for i in range(ord('a'), ord('z')+1) if chr(i) not in not_in_word]

    for pos, letter in enumerate(must_be_at):
        if letter is not None:
            word[pos] = letter
            max_counts[letter] -= 1
            if letter in remaining_letters:
                remaining_letters.remove(letter)

    x = []
    for i in range(len(word)):
        if word[i] is not None:
            x += [i]

    for key in must_contain:
        for i in range(len(word)):
            if i in must_contain[key] or i in x:
                must_contain[key].discard(i)
            else:
                must_contain[key].add(i)

    if None not in word:
        return ''.join(word)

    save_copy_Must_c = must_contain.copy()
    word, Gold = updating_word(word, must_contain, max_counts, "")
    must_contain = save_copy_Must_c

    if None not in word:
        return ''.join(word)

    x = []
    for i in range(len(word)):
        if word[i] is not None:
            x += [i]

    for key in backup:
        for i in range(len(word)):
            if i in x or i in backup[key]:
                backup[key].discard(i)
            else:
                backup[key].add(i)

    working_backup = backup.copy()
    for key in backup:
        if key in max_counts and max_counts[key] == 0:
            del working_backup[key]
        elif key not in max_counts:
            del working_backup[key]

    word, backup = updating_word(word, working_backup, max_counts, "")

    if None not in word:
        return ''.join(word)

    remaining_letters = [chr(i) for i in range(ord('a'), ord('z')+1) if chr(i) not in not_in_word]

    max_counts = {key: value for key, value in max_counts.items() if value != 0}
    result = []
    for key, value in max_counts.items():
        to_add = [key] * value
        result += to_add

    counts = 0
    for i in word:
        if i == None:
            counts += 1

    if len(result) < counts:
        result_len = len(result)
        for element in remaining_letters:
            if element not in result and element not in not_in_word:
                result += [element]
        result += remaining_letters

        word, max_counts = guess_word(result, max_counts, must_contain, word, result_len)
        return ''.join(word)

    for pos in range(word_length):
        if word[pos] is None:
            word[pos] = result[0]
            del result[0]
    return ''.join(word)
########################################################################
