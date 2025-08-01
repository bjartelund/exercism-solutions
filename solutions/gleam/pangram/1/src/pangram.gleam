import gleam/string
import gleam/set
import gleam/int
import gleam/list
pub fn is_pangram(sentence: String) -> Bool {
  sentence |> string.lowercase |> string.replace(" ","") |> string.replace("_","") |> string.replace(".","") |> string.to_graphemes |> list.filter(fn(letter) {filter_numbers(letter)})  |> set.from_list |> set.size == 26
}

pub fn filter_numbers(letter: String) -> Bool{
  let try_parse = int.parse(letter)
  case try_parse {
    Ok(_) -> False
    _ -> True
  }
}