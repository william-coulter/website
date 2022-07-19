module Pages.Home exposing (view)

import Components.Link exposing (link)
import Html exposing (Html, div, h1, text)
import Html.Attributes exposing (class)



-- VIEW


view : List (Html msg)
view =
    [ div [ class "h-full flex flex-col justify-center space-y-6" ]
        [ heading, links ]
    ]


heading : Html msg
heading =
    h1 [ class "text-center text-heading1" ]
        [ text "Greetings" ]


links : Html msg
links =
    div [ class "flex flex-row justify-center space-x-6 pb-2 border-b border-primary border-opacity-80" ]
        -- STARTHERE: Render article link
        [ link "about" "about", link "resume" "resume" ]
