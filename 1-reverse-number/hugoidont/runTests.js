const BG_GREEN = '\x1b[42m'
const BG_RED = '\x1b[41m'

const RESET_COLOR = '\x1b[0m'

module.exports = function runTests (tests, solver) {
  tests.forEach(({ input, expect }) => {
    const output = solver(input)

    console.log(`   Input: ${input}`)
    console.log(`   Expects: ${expect}`)
    console.log(`   Output:  ${output}`)

    const result = output === expect
    const color = result ? BG_GREEN : BG_RED

    console.log(color, result ? '   PASSED' : '   FAILED', RESET_COLOR)
    console.log()
  })
}
