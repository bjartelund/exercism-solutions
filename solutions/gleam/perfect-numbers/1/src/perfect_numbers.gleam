import gleam/iterator
import gleam/list
import gleam/int
import gleam/order
pub type Classification {
  Perfect
  Abundant
  Deficient
}

pub type Error {
  NonPositiveInt
}

pub fn classify(number: Int) -> Result(Classification, Error) {
  case number {
    i if i < 1 -> Error(NonPositiveInt)
    _ -> {
      let assert Ok(aliquot_sum) = number |> factorize |> exclude_self(number) |> sum_factors
      let compare = int.compare(number,aliquot_sum)
      case compare {
        order.Gt -> Ok(Deficient)
        order.Eq -> Ok(Perfect)
        order.Lt -> Ok(Abundant)
      }
    }
  }

}

pub fn exclude_self(factors: List(Int), number:Int) -> List(Int) {
  list.filter(factors,fn(i) {i != number})
}

pub fn sum_factors(factors:List(Int)) -> Result(Int,Nil) {
  list.reduce(factors,fn(acc,a) {acc+a})
}

pub fn factorize (number: Int) -> List(Int) {
  iterator.range(1,number/2) |> iterator.filter(fn(i) { number % i == 0 }) |> iterator.to_list
}
