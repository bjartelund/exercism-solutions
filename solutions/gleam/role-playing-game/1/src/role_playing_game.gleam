import gleam/option.{type Option}

pub type Player {
  Player(name: Option(String), level: Int, health: Int, mana: Option(Int))
}

pub fn introduce(player: Player) -> String {
  case player.name {
    option.Some(name) -> name
    option.None -> "Mighty Magician"
  }
}

pub fn revive(player: Player) -> Option(Player) {
  case player.health {
    0 -> if_dead(player)
    _ -> option.None
  }
}
pub fn if_dead(player: Player) -> Option(Player) {
  case player.level {
    i if i >= 10 -> option.Some(Player(..player,health:100, mana: option.Some(100)))
    _ -> option.Some(Player(..player,health:100,mana: option.None))
  }
}

pub fn cast_spell(player: Player, cost: Int) -> #(Player, Int) {
  case player.mana {
    option.Some(i) if i > cost -> #(Player(..player,mana:option.Some(i-cost)),cost*2)
    option.Some(_) -> #(player,0)
    _ -> #(Player(..player, health: substract_cost(player.health,cost)),0) 
  }}

pub fn substract_cost(health: Int, cost:Int) -> Int {
  case health - cost {
    i if i < 0 -> 0
    _ -> health -cost
  }
}
