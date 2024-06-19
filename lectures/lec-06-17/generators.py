def int_from(start):
    while(True):
        yield start # stop!
        start += 1
    # return None # deadcode

def generator_make_filter(xs, test):
    for x1 in xs:
        if test(x1):
            yield x1
    return None # deadcode

def generator_sieve(xs):
    def test(x1):
        return lambda x2: (x2 % x1 > 0)
    while True:
        x1 = next(xs)
        yield x1
        xs = generator_make_filter(xs, test(x1))
    return None # This line is deadcode
