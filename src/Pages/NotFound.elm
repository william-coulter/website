module Pages.NotFound exposing (..)

import Html exposing (Html, text)



-- MODEL


type alias Model =
    {}



-- INIT


init : ( Model, Cmd Msg )
init =
    ( {}, Cmd.none )



-- UPDATE


type alias Msg =
    {}


update : Msg -> Model -> ( Model, Cmd Msg )
update _ model =
    ( model, Cmd.none )



-- VIEW


view : List (Html msg)
view =
    [ text "Not found" ]
