const createRange = (
  from: number,
  to: number
): number[] => Array(to - from + 1).fill(0).map((_, i) => i + from);

const isPrime = (
  value: number
): boolean => (
  value >= 2 &&
  value === createRange(2, value).find((n) => value % n === 0)
);

export default isPrime;
