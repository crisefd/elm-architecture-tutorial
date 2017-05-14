-- Read more about this program in the official Elm guide:
-- https://guide.elm-lang.org/architecture/effects/random.html

import Html exposing (..)
import Html.Events exposing (..)
import Random



main =
  Html.program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }



-- MODEL


type alias Model =
  { dieFaces: List Int 
  }


init : (Model, Cmd Msg)
init =
  (Model (List.repeat 2 1), Cmd.none)



-- UPDATE


type Msg
  = Roll
  | NewFaces (List Int)


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Roll ->
      (model, Random.generate NewFaces (Random.list 2 (Random.int 1 6)))
    NewFaces newFaces ->
      (Model newFaces
      , Cmd.none)



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none



-- VIEW
aux arg =
  case arg of
  Just val -> val
  _ -> 0
     


view : Model -> Html Msg
view model =
  div []
    [ h1 [] [ text ( (toString (aux(List.head(model.dieFaces)))) ++   ++
                     (toString (aux(List.head(List.reverse(model.dieFaces)))) ) ) ]
    , button [ onClick Roll ] [ text Roll ]
    ]

