-module(huffman).
-export([encode/1, decode/2]).
-export([dict_from_phrase/1]).
-export([test/0, compression/2]).
-import(lists, [foldl/3, keysort/2, keyfind/3, filter/2, flatmap/2]).
-import(dict, [update_counter/3]).

% ========
%  ENCODE
encode([]) -> [];
encode(Phrase) -> 
    Dict = dict_from_phrase(Phrase),
    encode(Phrase, Dict).

encode([], _) -> [];
encode([Letter | Phrase], Dict) -> 
    {_, Code} = keyfind([Letter], 1, Dict),
    Code ++ encode(Phrase, Dict).

% ========
%  DECODE
decode([], _) -> [];
decode(Code, Dict) ->
    do_decode(Code, Dict, []).

do_decode([], _, Acc) -> Acc;
do_decode(Code, Dict, Acc) ->
    [{Char, BinChar}] = filter(fun({_, Char}) -> lists:prefix(Char, Code) end, Dict),
    do_decode(lists:subtract(Code, BinChar), Dict, Acc ++ Char).

% =====================================
% Cria o dicionário contendo o
% caractere e seu respectivo "binário"
make_bin_dict({Letter, _}) ->
    [{Letter, "0"}];
make_bin_dict({_,_,L, R}) ->
    make_bin_dict(L, "0") ++ make_bin_dict(R, "1").
make_bin_dict({_,_,L, R}, Val) ->
    make_bin_dict(L, Val ++ "0") ++ make_bin_dict(R, Val ++ "1");
make_bin_dict({Letter, _}, Val) ->
    [{Letter, Val}].

dict_from_phrase([]) -> [];
dict_from_phrase(Phrase) ->
    Freqs = make_freq_dict(Phrase),
    Tree = make_tree(Freqs, 0),
    make_bin_dict(Tree).

% ==========================================
% Cria o dicionário de frequências ordenado
% alfabeticamente e por frequência
make_freq_dict(Chars) ->
    Update_counter = fun(Char, Acc) -> update_counter([Char], 1, Acc) end,
    Dict = foldl(Update_counter, dict:new(), Chars),
    keysort(2, keysort(1, dict:to_list(Dict))).

% ===============
% Monta uma árvore a partir de um dicionário de frequências
% Tendo suas folhas sendo apenas caracteres
% Seus galhos nó com as somas de frequências
% Os nó mais proximos do tronco são os com a
% maior frequência
make_tree([Tree], _) -> Tree;
make_tree([Left, Right | Rest], Acc) ->
    Node = make_node(Left, Right),
    make_tree(keysort(2, [Node | Rest]), Acc + 1).

% ===========================
% Cria um nó contendo a soma
% dos valores de seus filhos
make_node(Left, Right) -> 
    Sum = element(2, Right) + element(2, Left),
    {num, Sum, Left, Right}.

% ==========
% TESTS
test() -> 
    Phrase1 = "",
    Dict1 = dict_from_phrase(Phrase1),
    Encoded1 = encode(Phrase1),
    assertEqual("Empty String            ", 
                Phrase1, 
                decode(Encoded1, Dict1), 
                compression(Phrase1, Encoded1)),
    
    Phrase2 = "A",
    Dict2 = dict_from_phrase(Phrase2),
    Encoded2 = encode(Phrase2),
    assertEqual("One Character(A)        ", 
                Phrase2, 
                decode(Encoded2, Dict2), 
                compression(Phrase2, Encoded2)),

    Phrase3 = "ABC",
    Dict3 = dict_from_phrase(Phrase3),
    Encoded3 = encode(Phrase3),
    assertEqual("Multiple Characters(ABC)", 
                Phrase3, 
                decode(Encoded3, Dict3), 
                compression(Phrase3, Encoded3)),
    
    Phrase4 = "AAAAAABCCCCCCDDEEEEE",
    Dict4 = dict_from_phrase(Phrase4),
    Encoded4 = encode(Phrase4),
    assertEqual("Big String (6A1B5C2D5E) ", 
                Phrase4, 
                decode(Encoded4, Dict4), 
                compression(Phrase4, Encoded4)).

assertEqual(Name, In, Out, Compress) when In == Out -> 
    io:fwrite("~p .. \e[0;32m[PASS] \e[0;33mCompression: ~w% \e[0m\n", [Name, Compress]);
assertEqual(Name, In, Out, _) -> 
    io:fwrite("~p .. \e[0;31m[FAIL]\e[0m\n", [Name]),
    io:fwrite(" > Expected: ~w\n", [In]),
    io:fwrite(" > Found...: ~w\n", [Out]).

compression(Before, After) ->
    ToBin = fun(X) -> integer_to_list(X, 2) end,
    A = length(After),
    B = length(flatmap(ToBin, Before)),
    B * (A/100).
