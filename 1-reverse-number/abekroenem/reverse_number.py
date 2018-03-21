import unittest

# Resolução do desafio
def reverse(number:int) -> int:
    return int(str(number)[::-1])

# Teste unitário
class ReverseTestCase(unittest.TestCase):
    INPUT = [1234, 12, 0, 6641112222223333333345678901118]
    OUTPUT = [4321, 21, 0, 8111098765433333333222222111466]

    def test_reverse_with_int(self):
        for index, number in enumerate(ReverseTestCase.INPUT):
            output = reverse(number)
            self.assertEqual(ReverseTestCase.OUTPUT[index], output)

    def test_reverse_with_string(self):
        with self.assertRaises(ValueError):
            reverse('lalala')
            
if __name__ == '__main__':
    unittest.main()