# Como rodar

## Requisitos
 - Erlang
 - Rebar3 (Pros testes, mas dá pra fazer manual)

## Passos
### Com o Rebar
```bash
rebar3 eunit
```

### Sem o Rebar
- Vá até a pasta `src` pelo temrinal
- Execute o repl do Erlang usando `erl`
Então execute o seguinte:
````erl
c(number).
number:reverse(6641112222223333333345678901118).
number:reverse(1234).
number:reverse(12).
number:reverse("lalala").
````

### Sem o rebar (a outa versão)
- Vá até a pasta `src` pelo temrinal
- Execute o repl do Erlang usando `erl`
Então execute o seguinte:
````erl
c(number_arit).
number_art:test().
````
