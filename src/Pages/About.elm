module Pages.About exposing (..)

import Html exposing (Html, a, div, img, p, text)
import Html.Attributes exposing (alt, class, href, rel, src, target)



-- VIEW


view : List (Html msg)
view =
    [ img
        [ src "assets/will.jpeg"
        , alt "A handsome young man"
        , class "mx-auto max-w-sm"
        ]
        []
    , p [ class "mt-10 text-center text-primary" ]
        [ text "Aspiring software engineer living in Sydney, Australia." ]
    , div
        [ class "flex justify-center space-x-6" ]
        [ a [ href "https://www.linkedin.com/in/william-coulter-854511147/", target "_blank", rel "noreferrer" ]
            [ text "LinkedIn" ]
        , a [ href "https://github.com/william-coulter", target "_blank", rel "noreferrer" ]
            [ text "GitHub" ]
        , a [ href "https://gitlab.com/william-coulter", target "_blank", rel "noreferrer" ]
            [ text "GitLab" ]
        ]
    ]
