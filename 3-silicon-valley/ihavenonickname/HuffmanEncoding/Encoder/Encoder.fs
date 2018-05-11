namespace Encoder

module Huffman =
    type private HuffmanNode =
        | Internal of HuffmanNode * HuffmanNode * int
        | Leaf of char * int

    let private huffmanTree text =
        let weight = function
        | Leaf (_, w) -> w
        | Internal (_, _, w) -> w

        let merge node1 node2 =
            Internal (node1, node2, weight node1 + weight node2)

        let rec makeTree leafs = 
            match leafs |> List.sortBy weight with
            | left :: right :: rest -> merge left right :: rest |> makeTree
            | [head] -> Some head
            | [] -> None

        text
        |> Seq.countBy id
        |> Seq.map Leaf
        |> List.ofSeq
        |> makeTree 

    let private codeTable tree =
        let merge =
            Map.fold (fun acc key value -> Map.add key value acc)

        let rec codeTable' acc code = function
        | Some (Leaf (c, _)) -> Map.add c code acc
        | Some (Internal (left, right, _)) -> 
            let fromLeft = codeTable' acc (code + "0") (Some left)
            let fromRight = codeTable' acc (code + "1") (Some right)
            merge fromLeft fromRight
        | None -> Map.empty

        match tree with
        | Some (Leaf (c, _)) -> Map.ofList [(c, "0")]
        | _ -> codeTable' Map.empty "" tree

    let private translate text table =
        text
        |> Seq.map (fun x -> Map.find x table)
        |> Seq.fold (+) ""

    let encode text =
        text |> (huffmanTree >> codeTable >> translate text)
