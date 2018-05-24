
Supondo que existe o comando `clojure` instalado na sua maquina (debian e archlinux tem no repositório)

Os argumentos são os numeros que vc quer inverter

```bash
chmod +x rev.clj
./rev.clj 1234 12 0 6641112222223333333345678901118
"Elapsed time: 32.788817 msecs"
{1234N 4321N, 12N 21N, 0N 0N, 6641112222223333333345678901118N 811198765433333333222222111466N}
```

Há um bug quando o numero possui um zero "no meio"


