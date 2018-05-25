# Travelling Salesman

O objetivo desse desafio é encontrar o menor caminho no grafo, que passa pelos pontos desejados

O programa deve ser apresentado no seguinte formato:

```bash
cat grafo.csv | ./salesman A B C > out.csv
```

Onde `grafo.csv` é um arquivo no formato

```csv
A, B, C
0, 1, 6
3, 0, 5
2, 7, 0
```

No caso, a distancia indo de `A` para `B` é `1` e de `B` para `A` é `3`

O output do programa deve ser um `csv` de uma só linha com os labels em ordem. Por exemplo

```csv
A, C, B
```

## Build

Dentro da pasta com seu nome, deve haver um `Makefile`.

Ao executar `make` deve gerar um `salesman` executavel

## TODO

* Descrição completa

* Dados de exemplo

* Dados para teste automatizados

* Teste automatico

