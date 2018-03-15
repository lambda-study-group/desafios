from functools import reduce

def reverse(num):
    lst = reduce(lambda acc, n: [n] + acc, str(num), [])
    return int(''.join(lst))


print(reverse(123))
print(reverse(12))
print(reverse(0))
print(reverse(6641112222223333333345678901118))
print(reverse('lalala'))
