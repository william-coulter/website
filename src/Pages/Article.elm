module Pages.Article exposing (..)

import Html exposing (Html, div, text)
import Http
import Markdown.Parser as MDParser
import Markdown.Renderer as MDRenderer



-- MODEL


type alias Model =
    { articleTitle : String
    , result : Maybe (Result Http.Error String)
    }



-- INIT


init : String -> ( Model, Cmd Msg )
init articleTitle =
    ( Model articleTitle Nothing, fetchArticle articleTitle )


fetchArticle : String -> Cmd Msg
fetchArticle _ =
    Http.get
        { url = "./assets/articles/you_win_some_and_you_lose_some.md"
        , expect = Http.expectString ArticleFetched
        }



-- UPDATE


type Msg
    = ArticleFetched (Result Http.Error String)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case ( msg, model ) of
        ( ArticleFetched result, _ ) ->
            ( { model | result = Just result }, Cmd.none )



-- VIEW


view : Model -> List (Html msg)
view { result } =
    [ case result of
        Nothing ->
            text "Loading..."

        Just r ->
            case r of
                Err _ ->
                    text "Error"

                Ok file ->
                    case parseMarkdown file of
                        Err err ->
                            text err

                        Ok rendered ->
                            div [] rendered
    ]


parseMarkdown : String -> Result String (List (Html msg))
parseMarkdown md =
    MDParser.parse md
        |> Result.mapError (List.map MDParser.deadEndToString >> List.head >> Maybe.withDefault "Error parsing Markdown")
        |> Result.andThen (\ast -> MDRenderer.render MDRenderer.defaultHtmlRenderer ast)
