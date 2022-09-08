module Pages.Home exposing (view)

import Components.Link exposing (ArticleLinkOpts, LinkOpts, articleLink, link)
import Html exposing (Html, div, h1, text)
import Html.Attributes exposing (class)



-- VIEW


view : List (Html msg)
view =
    [ div [ class "h-full flex flex-col justify-center space-y-6" ]
        [ heading
        , div
            [ class "flex flex-row justify-center space-x-6 pb-2 border-b border-primary border-opacity-80" ]
            links
        , div
            []
            articleLinks
        ]
    ]


heading : Html msg
heading =
    h1 [ class "text-center text-heading1" ]
        [ text "Greetings" ]


links : List (Html msg)
links =
    let
        render : List LinkOpts -> List (Html msg)
        render opts =
            List.map link opts
    in
    render
        [ { path = "about", display = "about" }
        , { path = "resume", display = "resume" }
        ]


articleLinks : List (Html msg)
articleLinks =
    let
        render : List ArticleLinkOpts -> List (Html msg)
        render opts =
            List.map articleLink opts
    in
    render
        [ { article = "determinism"
          , display = "A deterministic universe and what to do about it"
          , date = "01 June 2021"
          }
        ]
