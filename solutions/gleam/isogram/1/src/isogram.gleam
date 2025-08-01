import gleam/list
import gleam/string
pub fn is_isogram(phrase phrase: String) -> Bool {
  let filtered = phrase |> string.replace(" ","") |> string.replace("-","") |> string.lowercase
  let length = string.length(filtered)
  let unique_length = filtered |> string.to_graphemes |> list.unique |> list.length
  unique_length == length
}
