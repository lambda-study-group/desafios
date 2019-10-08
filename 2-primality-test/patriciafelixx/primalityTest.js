function primalityTest(n) {
    let c = 0;
    for (let i = 1; i <= n; i++) {
        n % i == 0 ? c++ : "";
    }
    return c == 2;
}

const inputs = [0, 1, 2, 3, 79, 1471, 104742, 104743];
const testes    = [];

inputs.forEach( x => {
    testes.push(`${x}: ${primalityTest(x)}`);
})

console.log(testes);
// [ '0: false', '1: false', '2: true', '3: true', '79: true', '1471: true', '104742: false', '104743: true' ]