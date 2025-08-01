import gleam/list
// Please define the Usd type
pub type Usd

// Please define the Eur type
pub type Eur
// Please define the Jpy type
pub type Jpy
// Please define the Money type
pub opaque type Money(unit) {
  Money(amount: Int)
}

pub fn dollar(amount: Int) -> Money(Usd) {
  let amount: Money(Usd) = Money(amount)
  amount
}

pub fn euro(amount: Int) -> Money(Eur) {
    let amount: Money(Eur) = Money(amount)
  amount
}

pub fn yen(amount: Int) -> Money(Jpy) {
    let amount: Money(Jpy) = Money(amount)
  amount
}

pub fn total(prices: List(Money(currency))) -> Money(currency) {
  list.fold(prices,Money(0),fn (b,a) {Money(b.amount+a.amount)})
}
