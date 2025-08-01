import gleam/set.{type Set}
import gleam/list
import gleam/string
pub fn new_collection(card: String) -> Set(String) {
  set.from_list([card])
}

pub fn add_card(collection: Set(String), card: String) -> #(Bool, Set(String)) {
  let contains_card = set.contains(collection,card)
  case contains_card {
    True -> #(True, collection)
    False -> #(False,set.insert(collection,card))
  }
}

pub fn trade_card(
  my_card: String,
  their_card: String,
  collection: Set(String),
) -> #(Bool, Set(String)) {
  let contains_my_card = set.contains(collection,my_card)
  let contains_their_card = set.contains(collection,their_card)
  let trade_result = perform_trade(my_card, their_card,collection)
  case contains_my_card {
    False -> #(False,trade_result.1)
    True -> case contains_their_card {
      True -> #(False,trade_result.1)
      False -> #(True,trade_result.1)
    }
  }
}
pub fn perform_trade(my_card: String,their_card:String,collection: Set(String)) -> #(Bool, Set(String)) {
  let without_my_card = set.delete(collection,my_card)
  add_card(without_my_card,their_card)
}

pub fn boring_cards(collections: List(Set(String))) -> List(String) {
  case list.length(collections){
    0 -> []
    _ -> {
      let assert Ok(reduced_list) = list.reduce(collections, fn(a,b) {set.intersection(a,b)})
      set.to_list(reduced_list)
    }
  }

}

pub fn total_cards(collections: List(Set(String))) -> Int {
  case list.length(collections) {
    0 -> 0
    _ -> {
      let assert Ok(reduced_collection) = list.reduce(collections, fn(a,b) {set.union(a,b)})
      set.size(reduced_collection)
    }
  }


}

pub fn shiny_cards(collection: Set(String)) -> Set(String) {
  set.filter(collection, fn(name) {string.starts_with(name,"Shiny")})
}
