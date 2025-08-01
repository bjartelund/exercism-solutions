pub fn secret_add(secret: Int) -> fn(Int) -> Int {
  let adder = fn(number: Int) -> Int {secret+number}
  adder
}

pub fn secret_subtract(secret: Int) -> fn(Int) -> Int {
  let sub = fn(number: Int) -> Int {number-secret}
  sub
}

pub fn secret_multiply(secret: Int) -> fn(Int) -> Int {
  let mult = fn(number: Int) -> Int {secret*number}
  mult
}

pub fn secret_divide(secret: Int) -> fn(Int) -> Int {
  let divider = fn(number: Int) -> Int {number/secret}
  divider
}

pub fn secret_combine(
  secret_function1: fn(Int) -> Int,
  secret_function2: fn(Int) -> Int,
) -> fn(Int) -> Int {
  let combiner = fn(number: Int) -> Int 
    { number |> secret_function1 |> secret_function2 }
}
