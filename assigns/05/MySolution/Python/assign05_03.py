####################################################
#!/usr/bin/env python3
####################################################
"""
HX-2024-06-14: 10 points
You are required to implement the following function
generator_merge2 WITHOUT using streams. A solution that
uses streams is disqualified.
"""
def generator_merge2(gen1, gen2, lte3):
    """
    Given two generators gen1 and gen2 and a comparison
    function lte3, the function generator_merge2 returns
    another generator that merges the elements produced by
    gen1 and gen2 according to the order specified by lte3.
    The function generator_merge2 is expected to work correctly
    for both finite and infinite generators.
    """
    try:
        elem1 = next(gen1)
    except StopIteration:
        elem1 = None

    try:
        elem2 = next(gen2)
    except StopIteration:
        elem2 = None

    while elem1 is not None or elem2 is not None:
        if elem1 is not None and (elem2 is None or lte3(elem1, elem2)):
            yield elem1
            try:
                elem1 = next(gen1)
            except StopIteration:
                elem1 = None
        else:
            yield elem2
            try:
                elem2 = next(gen2)
            except StopIteration:
                elem2 = None
####################################################
