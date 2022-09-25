module Pages.Article exposing (..)

import File exposing (File)
import Html exposing (Html, div, text)
import Markdown.Parser as MDParser
import Markdown.Renderer as MDRenderer
import Task



-- STARTHERE: Import as file


markdown =
    "# Hello\nThis is a body!"


astResult =
    markdown
        |> MDParser.parse



-- VIEW


view : String -> List (Html msg)
view _ =
    [ case
        astResult
            |> Result.mapError (List.map MDParser.deadEndToString >> List.head >> Maybe.withDefault "Error parsing Markdown")
            |> Result.andThen (\ast -> MDRenderer.render MDRenderer.defaultHtmlRenderer ast)
      of
        Ok rendered ->
            div [] rendered

        Err errors ->
            text errors
    ]
