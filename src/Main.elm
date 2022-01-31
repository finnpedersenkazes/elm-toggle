module Main exposing (..)

import Browser
import Html exposing (Html, text, div, h1, img, button)
import Html.Attributes exposing (src)
import Html.Events exposing (onClick)


---- MODEL ----

type LanguageStatus
  = JavaScript
  | Python

type alias Model =
    {language : LanguageStatus}


init : ( Model, Cmd Msg )
init =
    ( {language = JavaScript}, Cmd.none )



---- UPDATE ----


type Msg
    = Toggle


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
        let new_language = case model.language of
               JavaScript -> Python
               Python -> JavaScript
        in
        case msg of
            Toggle ->
                    ( {model | language = new_language}, Cmd.none )



---- VIEW ----


view : Model -> Html Msg
view model =
    div []
        [ img [ src "/logo.svg" ] []
        , h1 [] [ text "Your Elm App is working!" ]
        ,   div []
            [ button [ onClick Toggle ] [ text "Toggle" ]
            , h1 [] [ text (viewLanguage model) ]
            ]
        ]

viewLanguage : Model -> String
viewLanguage model =
    case model.language of
        JavaScript ->
            "JavaScript"
        Python ->
            "Python"


---- PROGRAM ----


main : Program () Model Msg
main =
    Browser.element
        { view = view
        , init = \_ -> init
        , update = update
        , subscriptions = always Sub.none
        }
