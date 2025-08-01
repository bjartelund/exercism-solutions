import gleam/string
// Please define the TreasureChest type
pub opaque type TreasureChest(treasure) {
  TreasureChest(password: String, treasure:treasure)
}
pub fn create(
  password: String,
  contents: treasure,
) -> Result(TreasureChest(treasure), String) {
  let password_length = string.length(password)
  case password_length {
    i if i >= 8 -> Ok(TreasureChest(password,contents))
    _ -> Error("Password must be at least 8 characters long")
  }
}

pub fn open(
  chest: TreasureChest(treasure),
  password: String,
) -> Result(treasure, String) {
  case chest.password == password {
    True -> Ok(chest.treasure)
    _ -> Error("Incorrect password")
  }
}
