import test from 'ava';
import isPrime from './isPrime';

test('isPrime unit tests', (context) => {
  context.false(isPrime(0))
  context.false(isPrime(1))
  context.true(isPrime(2))
  context.true(isPrime(3))
  context.true(isPrime(79))
  context.true(isPrime(1471))
  context.false(isPrime(104742))
  context.true(isPrime(104743))
});
