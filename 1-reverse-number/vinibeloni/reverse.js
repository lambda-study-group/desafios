/********* BIG NUMBERS *********/
const bigNumber = require('bignumber.js');

Number.__proto__.toLong = n => bigNumber(n.toString(32), 32).toString(10)

Number.__proto__.isLong = n => n.toString(32).length > 16
/*******************************/

//while (list.length > 0) { result.push(list.pop()) }
const reverseValue = n => n.toString().split('').reverse().join('')

const reverseAction = (validate, transform, n) => validate(n) ? reverseValue(transform(n)) : null

const reverse = n =>
    reverseAction(Number.isLong, Number.toLong, n) ||
    reverseAction(Number.isInteger, n => n, n) ||
    'erro'

const formatInput = value => Number.isLong(value) ? Number.toLong(value) : value

const inputs = [1234, 12, 0, 6641112222223333333345678901118, 'lalala']
inputs.forEach((n, i) => {
    console.log(`Input:  '${formatInput(n)}'\nOutput: '${reverse(n)}'\n`)
})
