pub type Error {
  NonPositiveNumber
}

pub fn steps(number: Int) -> Result(Int, Error) {
  case number {
    n if n <= 0 -> Error(NonPositiveNumber)
    _ -> Ok(recursive_collatz(number, 0))
  }
}

fn recursive_collatz(number: Int, generation: Int) -> Int {
  case is_even(number) {
    True -> recursive_collatz(number / 2, generation + 1)
    False ->
      case number {
        1 -> generation
        _ -> recursive_collatz(number * 3 + 1, generation + 1)
      }
  }
}

fn is_even(number: Int) -> Bool {
  number % 2 == 0
}
