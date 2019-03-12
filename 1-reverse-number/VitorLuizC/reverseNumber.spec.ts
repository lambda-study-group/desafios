import test from 'ava';
import reverseNumber from './reverseNumber';

test('reverseNumber unit tests', (context) => {
  context.is(reverseNumber(0), 0);
  context.is(reverseNumber(12), 21);
  context.is(reverseNumber(1234), 4321);
  context.is(reverseNumber(6641112222223333333345678901118n), 8111098765433333333222222111466);
});
