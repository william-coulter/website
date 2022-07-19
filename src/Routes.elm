module Routes exposing (Route(..), fromUrl)

import Url exposing (Url)
import Url.Parser exposing ((</>), Parser, map, oneOf, parse, s, string, top)


type Route
    = Home
    | About
    | Article String


routeParser : Parser (Route -> Route) Route
routeParser =
    oneOf
        -- A good blog on changing the base path of the SPA: https://bigardone.dev/blog/2019/06/06/dynamic-base-path-for-an-elm-spa
        [ map Home top
        , map Home (s "home")
        , map About (s "about")
        , map Article (s "article" </> string)
        ]


fromUrl : Url -> Maybe Route
fromUrl =
    parse routeParser
