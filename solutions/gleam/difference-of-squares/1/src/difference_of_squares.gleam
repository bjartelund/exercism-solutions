import gleam/iterator

pub fn square_of_sum(n: Int) -> Int {
  let sum = iterator.range(1,n)|> iterator.fold(from: 0, with: fn(acc, element) { element + acc })
  sum*sum
}

pub fn sum_of_squares(n: Int) -> Int {
  iterator.range(1,n) |> iterator.fold(from: 0, with: fn(acc, element) { element*element + acc })
}

pub fn difference(n: Int) -> Int {
  square_of_sum(n) - sum_of_squares(n)
}
