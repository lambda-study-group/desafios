namespace ReverseLib

module Reverse =
    open System

    let digits x =
        x
        |> double
        |> log10
        |> floor
        |> bigint

    let rec pow10 e =
        if e = 0I then
            1I
        else
            10I * pow10 ( e - 1I )

    let front x =
        x
        |> fun y -> y % 10I
        |> fun y -> y * pow10 (digits x)

    let rec reverseInt (x : bigint) : bigint =
        match (x < 10I) with
        | true -> x
        | false -> front(x) + reverseInt(x / 10I)
