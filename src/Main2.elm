port module Main exposing (..)

import Html exposing (..)
import Browser
import Html.Attributes exposing (..)
import Aframe exposing (..)

main : Program () Model Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
    }

type alias Model = Int

init : () -> (Model, Cmd Msg)
init _ =
    (0, Cmd.none)

subscriptions : Model -> Sub Msg
subscriptions model = calculate Calculate 

port calculate : (String -> msg) -> Sub msg

-- UPDATE


type Msg
  = Calculate String
  | Nothing


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
       
        Calculate string    ->
            case string of
                "Increment"     ->
                    (model + 1, Cmd.none)
                "Decrement"     ->
                    (model - 1, Cmd.none)
                _               ->
                    (model, Cmd.none)
        
        Nothing             ->
            (model, Cmd.none)

-- VIEW


view : Model -> Html Msg
view model =
    scene []
        [   
            atext [ avalue (String.fromInt model) , position 0 2 -4, color "black", width 8] []
        ,   box [color "#EF2D5E", position 1 0.5 -4, attribute "plus-box" "" ] []
        ,   box [color "#EF4533", position -1 0.5 -4, attribute "minus-box" ""] []
        ,   plane [ position 0 0 -4, rotation -90 0 0, width 4, height 4, color "#7BC8A4"  ] []
        ,   camera [] [ cursor [] [] ]
        ]
