const reverse = (
  value: bigint,
  reversion: bigint
): bigint => (
  value === 0n 
    ? reversion
    : reverse(value / 10n, reversion * 10n + value % 10n)   
);

const reverseNumber = (
  value: number | bigint
): number => Number(reverse(BigInt(value), 0n));

export default reverseNumber;
