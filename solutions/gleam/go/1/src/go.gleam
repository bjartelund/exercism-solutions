import gleam/result
pub type Player {
  Black
  White
}

pub type Game {
  Game(
    white_captured_stones: Int,
    black_captured_stones: Int,
    player: Player,
    error: String,
  )
}

pub fn apply_rules(
  game: Game,
  rule1: fn(Game) -> Result(Game, String),
  rule2: fn(Game) -> Game,
  rule3: fn(Game) -> Result(Game, String),
  rule4: fn(Game) -> Result(Game, String),
) -> Game {
  let game_result = rule1(game) |> result.map(rule2) |> result.map(rule3) |> result.flatten |> result.map(rule4)  |> result.flatten 
  case game_result {
    Ok(changed_game) -> change_player(changed_game)
    Error(error_message) -> Game(..game,error:error_message)
  }
}


pub fn change_player(game: Game) {
  case game.player {
    Black -> Game(..game,player: White)
    _ -> Game(..game,player: Black)
  }
}