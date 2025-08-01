import gleam/iterator
import gleam/list

pub fn egg_count(number: Int) -> Int {
  decimal_to_binary(number)
  |> count_true
}

pub fn count_true(input: List(Bool)) -> Int {
  input
  |> list.filter(fn(n) { n })
  |> list.length
}

pub fn decimal_to_binary(number: Int) -> List(Bool) {
  iterator.unfold(
    from: number,
    with: fn(n) {
      case n {
        0 -> iterator.Done
        n -> {
          let divison = divide(n)
          iterator.Next(element: divison.1, accumulator: divison.0)
        }
      }
    },
  )
  |> iterator.map(int_to_bool)
  |> iterator.to_list
  |> list.reverse
}

pub fn int_to_bool(number: Int) -> Bool {
  case number {
    1 -> True
    _ -> False
  }
}

pub fn divide(number: Int) -> #(Int, Int) {
  let divisor = 2
  let dividend = number / divisor
  let remainder = number % divisor
  #(dividend, remainder)
}
