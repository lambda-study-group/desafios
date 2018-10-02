-module(number_tests).

-include_lib("eunit/include/eunit.hrl").

numero_grande_test() ->
  ?assertEqual(8111098765433333333222222111466, number:reverse(6641112222223333333345678901118)).


quatro_digitos_test() ->
  ?assertEqual(4321, number:reverse(1234)).

dois_digitos_test() ->
  ?assertEqual(21, number:reverse(12)).

string_test() ->
  ?assertEqual(erro, number:reverse("lalala")).