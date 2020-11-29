module Main exposing (..)

import Browser
import Html exposing (Html, text)
import Html.Attributes exposing (id)
import Html.Events exposing (onClick)
import Html.Attributes exposing (class)

main = Browser.sandbox
    { init = init
    , view = view
    , update = update    
    }

type alias Model =
    { count : Int }

init : Model
init =
    { count = 1}

type Msg
    = Reset
    | Add Int

update : Msg -> Model -> Model
update msg model =
    case msg of
        Reset -> 
            { model | count = 0}
        Add increment ->
            { model | count = model.count + increment}

view : Model -> Html Msg
view model =
    Html.div [class "h-screen bg-gradient-to-br from-blue-400 to-indigo-200 flex justify-center items-center"]
        [
        Html.div [ class "bg-white rounded-xl p-8 container shadow-lg grid grid-row-3 gap-y-6 w-full" ]
            [Html.p [ class "text-xl text-center grid gitd-row-2 gap-y-6 font-sans"]
                [ text "Counter value is"
                , Html.span [ class "text-6xl text-center text-red-500 font-black",id "counter-value" ] [ text <| String.fromInt model.count ]
                ]
            , Html.div [ class "grid grid-cols-3 gap-x-6"]
                [ Html.button [ class "btn btn--primary", onClick <| Add 1, id "add-1" ] [ text "+" ]
                , Html.button [ class "btn btn--primary", onClick <| Add 3, id "add-3" ] [ text "+++" ]
                , Html.button [ class "btn btn--secondary", onClick Reset, id "reset" ] [ text "0" ]
                ]    
            ]
        ]     