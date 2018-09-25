import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)

main =
  Browser.sandbox { init = init, update = update, view = view }

-- MODEL

type alias Wish =
    { title: String
    , body: String
    , price: String
    , link: String
    }

type alias Model =
  { wishes : List Wish
  , activeWish: Int
  }

init : Model
init =
  { wishes = []
  , activeWish = 0
  }

-- UPDATE

type Msg
  = AddWish


update : Msg -> Model -> Model
update msg model =
  case msg of
    AddWish ->
      { model | wishes = model.wishes ++ [Wish "" "" "" ""] }

-- VIEW


view : Model -> Html Msg
view model =
  div []
    [ button [onClick AddWish] [text "Add wish"]
    ,  div []
      (List.map viewWish model.wishes)
    ]


viewWish : Wish -> Html msg
viewWish {title, body, price, link} =
  div []
    [ input [ type_ "text", placeholder "Title", value title ] []
    , input [ type_ "text", placeholder "Body", value body ] []
    , input [ type_ "number", placeholder "Price", value price ] []
    , input [ type_ "text", placeholder "link", value link ] []
    ]