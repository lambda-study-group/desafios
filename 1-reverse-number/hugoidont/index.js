const runTests = require('./runTests')

const tests = [
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
    input: 6641112222223333333345678901118n,
    expect: 8111098765433333333222222111466n,
  },
  {
    input: 'lalala',
    expect: 'erro',
  }
]


const solver = (input) => {
  if (typeof input !== 'bigint' && isNaN(input)) {
    return 'erro'
  }

  const asBigInt = BigInt(input)
  const stringfied = String(asBigInt)
  const result = stringfied.split('').reverse().join('')

  const numberResult = Number(result)

  if (numberResult > Number.MAX_SAFE_INTEGER) {
    return BigInt(result)
  }

  return numberResult
}


runTests(tests, solver)