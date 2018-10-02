-module(number).
-export([reverse/1]).

%                                Ah, o compose, como faz falta kkk
reverse(N) when is_integer(N) -> list_to_integer(do_reverse(integer_to_list(N)));
reverse(_) -> erro.

do_reverse([X]) -> [X];
do_reverse([X | XS]) -> do_reverse(XS) ++ [X].
