| User        | Solution           |
| ------------- |:-------------:|
| [souenzzo](https://github.com/souenzzo) | [Clojure](https://github.com/lambda-study-group/desafios/tree/master/4-rsa/souenzzo) |

# RSA Challenge

O objetivo desse desafio é fazer uma função que descriptografa uma mensagem utilizando a cryptografia RSA, que se baseia na fatoração de numeros primos.
No desafio temos uma palavra que está criprografada em blocos de código a partir de uma chave publica que precisa ser descriptografada descobrindo a chave privada.

A chave publica é feita apartir da multiplicação de primos(`n`) e de um divisor(`e`) com MDC 1 do φ de dessa multiplicação([para entender melhor])(https://www.lambda3.com.br/2012/12/entendendo-de-verdade-a-criptografia-rsa-parte-ii/).

Para o desafio temos a chave publica: `(n = ?,e = ?)`

Mas para descriptografar é preciso descobrir a chave privada com valores de `(n = ?, d = ?)`. Para isso precisamos encontrar o `d` pelo inverso multiplicativo de `e`. Um meio de descobrir é por meio do [algoritmo de euclides estendido](https://pt.wikipedia.org/wiki/Algoritmo_de_Euclides_estendido).

Com o `d` calculado, e com o `n` da chave publica é possivel descritografar os valores dos blocos um de cada vez por `valor^d mod n` substituindo os valores da chave privada.

----------------------

- **Input:** `v`(valor), `n`, e `e` são inteiros
- **Output**: Char / String


# Resumo de termos e relações

- (`p`, `q`) - Numeros primos "qualquer"

- (`e`, `n`) - Chave publica (você sabe)

- (`d`, `n`) - Chave privada (você quer descobrir)

- `n = p * q` - Calculo de `n`

- `ᶲ(p, q) = (p - 1)(q - 1)` - Calculo de ᶲ

- `e * d ≡ (K * ᶲ(p, q)) + 1` - Relação entre `p`, `q`, `e` e `d`. `K` é um inteiro positivo (existem vários possiveis `K` que satisfazem a relação).

- assert: `e` deve ser coprimo de `ᶲ(p, q)`

- `coprimos`: quando o `mdc(a, b)` é 1

- `msg_crypografada = mod(power(msg, e), n)`

- `msg = mod(power(msg_crypografada, d), n)`


### Testes

Para o desafio temos a chave publica: `(n = 21181,e = 11)`

e os blocos a serem descriptografados são:

`15706 8628 13264 21022 18699 8628`


Após descriptografar os valores em código, deve-se fazer um "de para" na tabela abaixo para descobrir a palavra secreta. Se deu certo deixe no seu README.md a resposta :star:

A | B | C | D | E | F | G | H | I | J | K | L | M | N | O | P | Q | R | S | T | U | V | X | Z |
----- | ----- | ----- | ----- | ----- | ----- | ----- | ----- | ----- | ----- | ----- | ----- | ----- | ----- | ----- | ----- | ----- | ----- | ----- | ----- | ----- | ----- | ----- | ----- |
10 | 11 | 12 | 13 | 14 | 15 | 16 | 17 | 18 | 19 | 20 | 21 | 22 | 23 | 24 | 25 | 26 | 27 | 28 | 29 | 30 | 31 | 32 | 33 |



Valores:

**Valor Cryptografado 1:** 15706 

**Valor Descriptografado:** -

**Valor Cryptografado 2:** 8628 

**Valor Descriptografado:** -

**Valor Cryptografado 3:** 13264 

**Valor Descriptografado:** -

**Valor Cryptografado 4:** 21022 

**Valor Descriptografado:** -

**Valor Cryptografado 5:** 18699 

**Valor Descriptografado:** -

**Valor Cryptografado 6:** 8628 

**Valor Descriptografado:** -

(Só revelaremos o valor descriptografado dps que alguem descobrir a palavra corretamente)
