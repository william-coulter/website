module Components.Link exposing (..)

import Html exposing (Html, a, article, div, p, text)
import Html.Attributes exposing (class, href)


link : String -> String -> Html msg
link path display =
    a [ href path, class "no-underline text-center text-heading2 hover:opacity-80" ]
        [ text display ]


type alias ArticleLinkOpts =
    { article : String
    , display : String
    , date : String
    }


articleLink : ArticleLinkOpts -> Html msg
articleLink { article, display, date } =
    div [ class "inline" ]
        [ link ("articles/" ++ article) display
        , p [ class "font-light font-color text-secondary opacity-80" ] [ text date ]
        ]
