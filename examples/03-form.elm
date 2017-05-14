import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)


main =
  Html.beginnerProgram
    { model = model
    , view = view
    , update = update
    }



-- MODEL


type alias Model_ =
  { name : String
  , password : String
  , passwordAgain : String
  , some: String
  }


model : Model_
model =
  Model_ "" "" "" ""



-- UPDATE


type Msg
    = Name String
    | Password String
    | PasswordAgain String
    | Some String


update : Msg -> Model_-> Model_
update msg model =
  case msg of
    Name name ->
      { model | name = name }

    Password password ->
      { model | password = password }

    PasswordAgain password ->
      { model | passwordAgain = password }
    _ ->
      Debug.log( toString( msg))
      { model | passwordAgain = "XX" }





-- VIEW


view : Model_ -> Html Msg
view model =
  div []
    [ input [ type_ "text", placeholder "Name", onInput Name ] []
    , input [ type_ "password", placeholder "Password", onInput Password ] []
    , input [ type_ "password", placeholder "Re-enter Password", onInput PasswordAgain ] []
    , input [ type_ "password", placeholder "Some", onInput Some ] []
    , viewValidation model
    ]


viewValidation : Model_-> Html msg
viewValidation model =
  let
    disabledButton =
      if model.password == model.passwordAgain &&
         model.password /= "" then
        False
      else 
        True
  in
    div [] 
        [ button [ disabled disabledButton ] 
                 [ text "Submit" ] ]
