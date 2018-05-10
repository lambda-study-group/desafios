# Primality Test

O objetivo desse desafio é fazer uma função que descriptografa uma mensagem utilizando a cryptografia RSA, que se baseia na fatoração de numeros primos.
No desafio temos uma palavra que está cryprografada em blocos de código que precisa ser descriptografada descobrindo a chave privada a partir da chave publica.

A chave publica da criptografia é feita apartir da multiplicação de primos(`n`) e de um divisor(`e`) com MDC 1 do φ de dessa multiplicação(Para entender melhor)[https://www.lambda3.com.br/2012/12/entendendo-de-verdade-a-criptografia-rsa-parte-ii/].

Para o desafio temos a chave publica: `(n = 21181,e = 11)`

Mas para descriptografar é preciso descobrir a chave privada.
Para isso precisamos encontrar o inverso multiplicativo `d` de `e` a partir do [algoritmo de euclides estendido](https://pt.wikipedia.org/wiki/Algoritmo_de_Euclides_estendido).

Com o `d` calculado é possivel ter a chave privada: `(n = 21181, d = ?)`
e descritografar os valores dos blocos um de cada vez por `valor^d mod n`

----------------------

**Input:** Valores, `n`, e `e` são inteiros
**Output**: Char / String

### Testes

Os blocos a serem descriptografados são:
`15706 8628 13264 21022 18699 8628`

Após descriptografar os valores em código, deve-se fazer um "de para" na tabela abaixo para descobrir a palavra secreta. Se deu certo deixe no seu README.md a resposta :star:

A | B | C | D | E | F | G | H | I | J | K | L | M | N | O | P | Q | R | S | T | U | V | X | Z |
----- | ----- | ----- | ----- | ----- | ----- | ----- | ----- | ----- | ----- | ----- | ----- | ----- | ----- | ----- | ----- | ----- | ----- | ----- | ----- | ----- | ----- | ----- | ----- |
10 | 11 | 12 | 13 | 14 | 15 | 16 | 17 | 18 | 19 | 20 | 21 | 22 | 23 | 24 | 25 | 26 | 27 | 28 | 29 | 30 | 31 | 32 | 33 |

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