import gleam/int
import gleam/list
import gleam/string

pub fn is_armstrong_number(number: Int) -> Bool {
  let count_digits = number_of_digits(number)
  let digits = split_into_digits(number)
  let raised_digits = list.map(digits, fn(n) {power_digits(n,count_digits)})
  sum_of_list(raised_digits) == number
}

pub fn sum_of_list(input: List(Int)) -> Int {
  let assert Ok(sum) = input |> list.reduce(fn(acc, x) { acc + x })
  sum
}

pub fn split_into_digits(number:Int) -> List(Int) {
  int.to_string(number)|> string.to_graphemes |> list.map(fn(i) {parse(i)})
}

pub fn parse(number: String) -> Int {
  let assert Ok(integer) = int.parse(number)
  integer
}

pub fn number_of_digits (number: Int) -> Int {
  int.to_string(number) |> string.length
}

pub fn power_digits(digit: Int, power:Int) -> Int {
  let assert Ok(power) = list.repeat(digit,power) |> list.reduce(fn(acc,x) {acc*x})
  power
}
