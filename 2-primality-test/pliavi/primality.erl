-module(primality).
-export([is_prime/1, test/0, remove_composites/2, primes_until/1]).

is_prime(N) when is_integer(N) and (N > 1) -> lists:member(N, primes_until(N));
is_prime(_) -> false.

primes_until(N) -> remove_composites(1, lists:seq(2, N + 1)).

remove_composites(I, List) when I >= length(List) -> List;
remove_composites(I, List) -> 
    N = lists:nth(I, List),
<<<<<<< HEAD
=======
    % io:fwrite("~w -> ~w~n", [N, List]),
>>>>>>> ead51b940031e8915ff0b5feeef03fd28cd718bf
    Filter = fun(X) -> (X == N) orelse (X rem N =/= 0) end,
    remove_composites(I + 1, lists:filter(Filter, List)).

test() -> assertEqual("0 is not prime!     ", false, is_prime(0)),
          assertEqual("1 is not prime!     ", false, is_prime(1)),
          assertEqual("2 is prime!         ", true , is_prime(2)),
          assertEqual("3 is prime!         ", true , is_prime(3)),
          assertEqual("79 is prime!        ", true , is_prime(79)),
          assertEqual("1471 is prime!      ", true , is_prime(1471)),
          assertEqual("104742 is not prime!", false, is_prime(104742)),
          assertEqual("104743 is prime!    ", true , is_prime(104743)).

assertEqual(Name, In, Out) when In == Out -> io:fwrite("Teste: " ++ Name ++ " .. \e[0;32m[PASS]\e[0m\n");
assertEqual(Name, In, Out) -> 
    io:fwrite("Test: " ++ Name ++ " .. \e[0;31m[FAIL]\e[0m\n"),
    io:fwrite(" > Expected: ~w\n", [In]),
    io:fwrite(" > Found...: ~w\n", [Out]).
<<<<<<< HEAD
=======

>>>>>>> ead51b940031e8915ff0b5feeef03fd28cd718bf
