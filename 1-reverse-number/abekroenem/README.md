# Reverse Number

## Resolução

Criei uma função com tipos definidos de entrada e saída, e utilizei simples conversão de `int` para `str`,
facilitando assim a inversão dos valores.

```python
def reverse(number:int) -> int:
    return int(str(number)[::-1])
```

## Como rodar

```shell
$ python reverse_number.py -v
test_reverse_with_int (__main__.ReverseTestCase) ... ok
test_reverse_with_string (__main__.ReverseTestCase) ... ok

----------------------------------------------------------------------
Ran 2 tests in 0.001s

OK
```