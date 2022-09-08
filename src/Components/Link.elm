module Components.Link exposing (..)

import Html exposing (Html, a, article, div, p, text)
import Html.Attributes exposing (class, href)


type alias LinkOpts =
    { path : String
    , display : String
    }


link : LinkOpts -> Html msg
link { path, display } =
    a [ href path, class "no-underline text-center text-heading2 hover:opacity-80" ]
        [ text display ]


type alias ArticleLinkOpts =
    { article : String
    , display : String
    , date : String
    }


articleLink : ArticleLinkOpts -> Html msg
articleLink { article, display, date } =
    div [ class "flex flex-row justify-between" ]
        [ link { path = "articles/" ++ article, display = display }
        , p [ class "font-light text-primary opacity-80" ] [ text date ]
        ]
