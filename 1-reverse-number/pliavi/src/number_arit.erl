-module(number_arit).
-export([reverse/1, test/0]).

% ~Há, 3 da madruga, mas tá aí a versão sem usar listas/strings!~
reverse(N) when is_integer(N) -> do_reverse(N, 0);
reverse(_) -> erro.

% XXX: Tive que fazer isso porque a precisão do float tava
%      Bugando numeros grandes
% bin_div(X, Y) -> list_to_integer(binary_to_list(float_to_binary(X / Y, [{decimals, 0}]))).
% continua dando errado, mas não quero usar listas
% bin3(X) -> [H] = binary_to_list(<<<<K>> || <<K:3>> <= <<X:3>>>>), H.
% OK desisto

% chunk(N) -> bin_div(N, 10) - (bin_div(next(N), 10)).
chunk(N) when N < 10 -> N;
chunk(N) -> list_to_integer(lists:droplast(integer_to_list(N))).

next(N) -> N rem 10.

do_reverse(N, Acc) when N < 10 -> Acc * 10 + N;
do_reverse(N, Acc) -> 
    Accum = Acc * 10 + next(N),
    do_reverse(chunk(N), Accum).

test() -> assertEqual("GrandeNum", 8111098765433333333222222111466, reverse(6641112222223333333345678901118)),
          assertEqual("QuatroUm ", 4321, reverse(1234)),  
          assertEqual("VinteUm  ", 21, reverse(12)),
          assertEqual("String   ", erro, reverse("lalala")).

assertEqual(Name, In, Out) when In == Out -> io:fwrite("Teste: " ++ Name ++ " .. \e[0;32m[PASS]\e[0m\n");
assertEqual(Name, In, Out) -> 
    io:fwrite("Teste: " ++ Name ++ " .. \e[0;31m[FAIL]\e[0m\n"),
    io:fwrite(" > Expected: ~w\n", [In]),
    io:fwrite(" > Found...: ~w\n", [Out]).
