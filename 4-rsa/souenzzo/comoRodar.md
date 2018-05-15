
Supondo que existe o comando `clojure` instalado na sua maquina (debian e archlinux tem no repositório)

Os argumentos são (em ordem):

- `e`: base
- `n`: chave publica
- & `vs`: valores

```bash
chmod +x rsa.clj
## Resultado rapido. Descriptografa sem achar a chave privada
./rsa.clj --brute-force 11 21181 15706 8628 13264 21022 18699 8628
"Elapsed time: 7.904143 msecs"
{:e 11, :n 21181, :msg "lambda"}
## Resultado lento. Encontra a chava privada
./rsa.clj --find-private 11 21181 15706 8628 13264 21022 18699 8628
"Elapsed time: 108820.047526 msecs"
{:p 359, :q 59, :e 11, :n 21181, :d 192539, :msg "lambda"}
## !! Perigo !! - Potencialmente MUITO lento: Lista uma quantidade `a` de chaves primarias possiveis.
./rsa.clj --list-private 11 21181 1
"Elapsed time: 108820.047526 msecs"
{:p 359, :q 59, :e 11, :n 21181, :ds (192539)}
```



