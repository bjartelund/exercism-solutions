// Please define the TreasureChest generic custom type
pub type TreasureChest(a) {
  TreasureChest(password:String,treasure:a)
}
// Please define the UnlockResult generic custom type
pub type UnlockResult(a) {
  Unlocked(treasure:a)
  WrongPassword
}

pub fn get_treasure(
  chest: TreasureChest(a),
  password: String,
) -> UnlockResult(a) {
  let password_match = password == chest.password 
  case password_match {
    True -> Unlocked(chest.treasure)
    False -> WrongPassword
  }
  }

