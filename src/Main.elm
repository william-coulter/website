module Main exposing (Model, Msg(..), init, main, subscriptions, update, view)

import Browser
import Browser.Navigation as Nav
import Html exposing (Html, div)
import Html.Attributes exposing (class, href)
import Pages.About as About
import Pages.Article as Article
import Pages.Home as Home
import Pages.NotFound as NotFound
import Routes
import Url



-- MODEL


type Model
    = Home Nav.Key Home.Model
    | About Nav.Key About.Model
    | Article Nav.Key Article.Model
    | NotFound Nav.Key NotFound.Model


init : () -> Url.Url -> Nav.Key -> ( Model, Cmd Msg )
init _ url key =
    let
        model =
            Routes.fromUrl url
                |> modelFromRoute key
    in
    ( model, Cmd.none )


getKey : Model -> Nav.Key
getKey model =
    case model of
        Home key _ ->
            key

        About key _ ->
            key

        Article key _ ->
            key

        NotFound key _ ->
            key


modelFromRoute : Nav.Key -> Maybe Routes.Route -> Model
modelFromRoute key r =
    case r of
        Just Routes.Home ->
            Home.init |> Tuple.first |> Home key

        Just Routes.About ->
            About.init |> Tuple.first |> About key

        Just (Routes.Article s) ->
            Article.init s |> Tuple.first |> Article key

        Nothing ->
            NotFound.init |> Tuple.first |> NotFound key



-- UPDATE


type Msg
    = LinkClicked Browser.UrlRequest
    | UrlChanged Url.Url


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case ( msg, model ) of
        ( LinkClicked urlRequest, _ ) ->
            case urlRequest of
                Browser.Internal url ->
                    ( model, Nav.pushUrl (getKey model) (Url.toString url) )

                Browser.External href ->
                    ( model, Nav.load href )

        ( UrlChanged url, _ ) ->
            ( Routes.fromUrl url
                |> modelFromRoute (getKey model)
            , Cmd.none
            )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none



-- VIEW


view : Model -> Browser.Document Msg
view model =
    let
        body =
            case model of
                Home _ _ ->
                    Home.view

                About _ _ ->
                    About.view

                Article _ { article } ->
                    Article.view article

                NotFound _ _ ->
                    NotFound.view
    in
    { title = "William Coulter"
    , body =
        pageSkeleton body
    }


pageSkeleton : List (Html msg) -> List (Html msg)
pageSkeleton page =
    [ div [ class "flex w-screen h-screen p-4 bg-solarized-dark-base02 overflow-auto" ] [ div [ class "w-6/12 h-2/4 mx-auto my-auto" ] page ] ]



-- MAIN


main : Program () Model Msg
main =
    Browser.application
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        , onUrlChange = UrlChanged
        , onUrlRequest = LinkClicked
        }
