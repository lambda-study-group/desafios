const { 
  toString,
  split,
  reverse,
  compose,
  join,
} = require('ramda');
const BigNumber = require('bignumber.js');

const bigNumtoArray = value => BigNumber(value.toString(16), 16).toString(10).split('');

const reverseNum = (value, acc = 0, decimalPlace = 1) => {
  const newDecimalPlace = decimalPlace * 10;
  const mod = value % newDecimalPlace
  const decimalAmount = mod ? mod : value; // ex: 10 % 10 === 0 => 10 || 8 % 10 === 8 => 8
  const newAcc = acc * 10 + (decimalAmount / decimalPlace)
  
  return value - decimalAmount === 0 ? newAcc : reverseNum(value - decimalAmount, newAcc, newDecimalPlace)
}

const chunker = (arr, chunkSize, acc = '', index = 0) => {
  const chunk = chunkSize === 0 
    ? parseInt(arr.join(''), 10)
    : parseInt(arr.slice(index, index + chunkSize).join(''), 10)

  // const newAcc = acc * Math.pow(10, chunkSize) + reverseNum(chunk);
  const newAcc = reverseNum(chunk).toString() + acc;
  return chunkSize !== 0 && arr.length >= index + chunkSize
    ? chunker(arr, chunkSize, newAcc, index + chunkSize)
    : parseInt(newAcc)
}

const solver = value => {
  const numbers = bigNumtoArray(value);
  const arrSize = numbers.length
  const nChunks = Math.round(arrSize / 10)
  const chunkSize = nChunks === 0 ? 0 : Math.round(arrSize / nChunks)
  return chunker(numbers, chunkSize);
}

const tests =
[ 
  {
    input: 0,
    expect: 0,
  },
  {
    input: 12,
    expect: 21,
  },
  {
    input: 1234,
    expect: 4321,
  },
  {
    input: 6641112222223333333345678901118,
    expect: 8.478968809712333e+28,
  },
];

tests.forEach(({input, expect}) => {
    const output = solver(input);
    console.log(`   Input: ${input}`);
    console.log(`   Expects: ${expect}`);
    console.log(`   Output:  ${output}`);
    console.log(output === expect ? ` OK!` : ` FAILED`)
})