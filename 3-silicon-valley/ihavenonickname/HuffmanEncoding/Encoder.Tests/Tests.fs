module Tests

open Xunit

[<Fact>]
let ``Empty string`` () =
    let input = ""

    let result = Encoder.Huffman.encode input

    Assert.Equal(0, Seq.length result)

[<Fact>]
let ``Short string with no repetitions`` () =
    let input = "ABC"

    let result = Encoder.Huffman.encode input

    Assert.Equal(5, Seq.length result)

[<Fact>]
let ``Long string with no repetitions`` () =
    let input = "ABCDEFGHIJKLMNOPQ"

    let result = Encoder.Huffman.encode input

    Assert.Equal(70, Seq.length result)

[<Fact>]
let ``Short string with repetitions`` () =
    let input = "AAA"

    let result = Encoder.Huffman.encode input

    Assert.Equal(3, Seq.length result)

[<Fact>]
let ``Long string with repetitions`` () =
    let input = "AAAAAAAAAABBBBBBBBBBCCCCCCCCC"

    let result = Encoder.Huffman.encode input

    Assert.Equal(48, Seq.length result)

[<Fact>]
let ``Test from readme`` () =
    let input = "AAAAAABCCCCCCDDEEEEE"

    let result = Encoder.Huffman.encode input

    Assert.Equal(43, Seq.length result)
