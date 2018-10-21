# Como rodar

- Vá até a pasta `src` pelo terminal
- Execute o repl do Erlang usando `erl`
Então execute o seguinte:

### Usar
````erlang
c(huffman).

% Codificar
huffman:encode("ABC"). % > "10110"

% Decodificar
huffman:dict_from_phrase("ABC").
huffman:decode("10010111010101010", D). % > "ACABAAAAA"
````

### Testes
````erlang
c(huffman).

huffman:test().
````
