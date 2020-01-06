import Html exposing (..)
import Html.Attributes exposing (..)

main =
  scene [ ] 
    [ box [ position -1 0.5 -3, rotation 0.0 45.0 0.0, color "#4CC3D9" ] [] 
    , sphere [ position 0.0 1.25 -5, radius 1.25, color "#EF2D5E" ] []
    , cylinder [ position 1 0.75 -3, radius 0.5, height 1.5, color "#FFC65D" ] []
    , plane [ position 0 0 -4, rotation -90 0 0, width 4, height 4, color "#7BC8A4" ] []
    , sky [ color "#ECECEC" ] [] 
    ]





scene : List (Attribute msg) -> List (Html msg) -> Html msg
scene =
    node "a-scene"

cursor : List (Attribute msg) -> List (Html msg) -> Html msg
cursor =
    node "a-cursor"

camera : List (Attribute msg) -> List (Html msg) -> Html msg
camera =
    node "a-camera"
entity : List (Attribute msg) -> List (Html msg) -> Html msg
entity =
    node "a-entity"

box : List (Attribute msg) -> List (Html msg) -> Html msg
box =
    node "a-box"

plane : List (Attribute msg) -> List (Html msg) -> Html msg
plane =
    node "a-plane"

sky : List (Attribute msg) -> List (Html msg) -> Html msg
sky =
    node "a-sky"

sphere : List (Attribute msg) -> List (Html msg) -> Html msg
sphere =
    node "a-sphere"

cylinder : List (Attribute msg) -> List (Html msg) -> Html msg
cylinder =
    node "a-cylinder"

radius : Float -> Attribute msg
radius value =
    attribute "radius" (String.fromFloat value)

position : Float -> Float -> Float -> Attribute msg
position x y z =
    [ x, y, z ]
        |> List.map String.fromFloat
        |> List.intersperse " "
        |> String.concat
        |> attribute "position"

rotation : Float -> Float -> Float -> Attribute msg
rotation x y z =
    [ x, y, z ]
        |> List.map String.fromFloat
        |> List.intersperse " "
        |> String.concat
        |> attribute "rotation"

color : String -> Attribute msg
color value =
    attribute "color" value 

height : Float -> Attribute msg
height value =
    attribute "height" (String.fromFloat value)

width : Float -> Attribute msg
width value =
    attribute "width" (String.fromFloat value)
    