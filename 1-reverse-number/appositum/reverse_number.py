from functools import reduce

def reverse(num):
    """Return a reversed integer.

    >>> reverse(1234)
    4321
    >>> reverse(12)
    21
    >>> reverse(0)
    0
    >>> reverse(6641112222223333333345678901118)
    8111098765433333333222222111466
    >>> reverse('lalala')
    'lalala is not a number!'
    """

    if type(num) != int:
        return num + ' is not a number!'

    lst = reduce(lambda acc, n: [n] + acc, str(num), [])
    return int(''.join(lst))


if __name__ == '__main__':
    import doctest
    doctest.testmod()
