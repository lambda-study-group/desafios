function reverseNumber(n) {
    return Number.isInteger(n) ? n.toString().split("").reverse().join("") : "erro";
}

const inputs    = [1234, 12, 0, 6641123456789018, 'erro'];
const outputs   = [4321, 21, 0, 8109876543211466, 'erro'];
const testes    = [];

inputs.forEach((x, i) => {
    testes.push(reverseNumber(x) == outputs[i]);
})

console.log(testes) // [ true, true, true, true, true ]