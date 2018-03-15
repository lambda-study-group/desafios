module Main exposing (main)

import Html exposing (Html, div, p, text, a)
import Html.Attributes exposing (href)


main =
    div []
        [ p [] [ text <| toString <| reverseNum 1234 ]
        , p [] [ text <| toString <| reverseNum 12 ]
        , p [] [ text <| toString <| reverseNum 0 ]
        , p []
            [ a [ href "https://git.io/vxt9k" ]
                [ text <| toString <| reverseNum 6641112222223333333345678901118 ]
            ]
        -- , p [] [ text <| toString <| reverseNum "lala" ] -- Can't even compile with this, remove first `--` from the beginning of the line
        ]


reverseNum : Int -> Int
reverseNum number =
    number
        |> toString
        |> String.reverse
        |> String.toInt
        |> Result.withDefault 0
