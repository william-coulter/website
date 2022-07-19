module Pages.Article exposing (..)

import Html exposing (Html, text)



-- VIEW


view : String -> List (Html msg)
view s =
    [ text <| "Article: " ++ s ]
