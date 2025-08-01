import gleam/list
// TODO: please define the Pizza custom type
pub type Pizza {
  Margherita
  Caprese
  Formaggio
  ExtraSauce(Pizza)
  ExtraToppings(Pizza)
}
pub fn pizza_price(pizza: Pizza) -> Int {
  case pizza {
    Margherita -> 7
    Caprese -> 9
    Formaggio -> 10
    ExtraSauce(a) -> 1+pizza_price(a)
    ExtraToppings(b) -> 2+pizza_price(b)
  }
}

pub fn order_price(order: List(Pizza)) -> Int {
  let base_price = case list.length(order) {
    2 -> 2
    1 -> 3
    _ -> 0
  }
  list.fold(order,base_price,fn(a,b) {a+pizza_price(b)})
}
