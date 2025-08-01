import gleam/iterator
import gleam/list
import gleam/io
import gleam/int
import gleam/string

pub type Command {
  Wink
  DoubleBlink
  CloseYourEyes
  Jump
  Reverse
  None
}

pub fn commands(encoded_message: Int) -> List(Command) {
  let bools = convert(encoded_message)
  let commands =
    bools
    |> list.index_map(to_command)
    |> list.filter(fn(x) { x != None })
  case list.first(commands) {
    Ok(Reverse) -> list.filter(commands, fn(x) { x != Reverse })
    _ -> list.reverse(commands)
  }
}

pub fn to_command(i: Int, x: Bool) -> Command {
  case i, x {
    4, True -> Wink
    3, True -> DoubleBlink
    2, True -> CloseYourEyes
    1, True -> Jump
    0, True -> Reverse
    _, _ -> None
  }
}

pub fn convert(decimal: Int) -> List(Bool) {
  int.to_base2(decimal)
  |> string.to_graphemes
  |> list.map(cast_to_bool)
  |> pad_list(5)
}

pub fn cast_to_bool(s: String) -> Bool {
  case s {
    "1" -> True
    _ -> False
  }
}

pub fn pad_list(input: List(Bool), total_length: Int) -> List(Bool) {
  let padding =
    iterator.repeat(False)
    |> iterator.take(total_length - list.length(input))
    |> iterator.to_list
  list.concat([padding, input])
}

pub fn int_to_bool(i: Int) -> Bool {
  case i {
    1 -> True
    _ -> False
  }
}

pub fn divide_by_two(decimal: Int) -> #(Int, Int) {
  let quotient = decimal / 2
  let remainder = decimal % 2
  #(quotient, remainder)
}
