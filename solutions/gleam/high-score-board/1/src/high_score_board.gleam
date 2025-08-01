import gleam/map.{type Map}
import gleam/list
import gleam/option
import gleam/result
pub type ScoreBoard =
  Map(String, Int)

pub fn create_score_board() -> ScoreBoard {
  let score_map = map.new()
  add_player(score_map,"The Best Ever",1000000)
}

pub fn add_player(
  score_board: ScoreBoard,
  player: String,
  score: Int,
) -> ScoreBoard {
  map.insert(score_board,player,score)
}

pub fn remove_player(score_board: ScoreBoard, player: String) -> ScoreBoard {
  map.delete(score_board,player)
}

pub fn update_score(
  score_board: ScoreBoard,
  player: String,
  points: Int,
) -> ScoreBoard {
  let increment  = fn(x) {
    case x {
      option.Some(i) -> i + points
      option.None -> 0
    }
  }
  let existing = map.get(score_board,player)
  case existing {
    Ok(_) -> map.update(score_board,player,increment)
    Error(_) -> score_board

  }
}

pub fn apply_monday_bonus(score_board: ScoreBoard) -> ScoreBoard {
  map.map_values(score_board,fn(_,value) {value + 100})
  //list.map(map.keys(score_board), fn(key)  {addbonus(score_board,key)})
}
pub fn addbonus(score_board: ScoreBoard, key: String) -> ScoreBoard {
  let increment_by_hundred  = fn(x) {
    case x {
      option.Some(i) -> i + 100
      option.None -> 0
    }
  }
  map.update(score_board,key,increment_by_hundred)
}

