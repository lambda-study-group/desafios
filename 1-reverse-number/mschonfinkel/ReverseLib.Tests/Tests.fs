module Tests

open System
open Xunit

open ReverseLib.Reverse

[<Fact>]
let ``Testing 1234`` () =
    let expected = 4321I
    let actual = reverseInt 1234I
    printfn "Expected %A \t Actual %A" expected actual
    Assert.Equal(expected, actual)

[<Fact>]
let ``Testing 12`` () =
    let expected = 21I
    let actual = reverseInt 12I
    printfn "Expected %A \t Actual %A" expected actual
    Assert.Equal(expected, actual)

[<Fact>]
let ``Testing 0`` () =
    let expected = 0I
    let actual = reverseInt 0I
    printfn "Expected %A \t Actual %A" expected actual
    Assert.Equal(expected, actual)

[<Fact>]
let ``Testing 6641112222223333333345678901118`` () =
    let expected = 8111098765433333333222222111466I
    let actual = reverseInt 6641112222223333333345678901118I
    printfn "Expected %A \t Actual %A" expected actual
    Assert.Equal(expected, actual)

