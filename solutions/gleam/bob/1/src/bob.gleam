import gleam/string
import gleam/list
import gleam/int
pub fn hey(remark: String) -> String {
  let conditions = [is_shouting(remark),is_question(remark),is_silence(remark),is_non_letters(remark)]
  case conditions {
    [True,False,False,False] -> "Whoa, chill out!"
    [False,True,False,_] -> "Sure."
    [_,True,_,True] -> "Sure."
    [True,True,False,False] -> "Calm down, I know what I'm doing!" 
    [_,_,True,_] -> "Fine. Be that way!" 
    _ -> "Whatever."
  }
}
pub fn is_shouting(remark: String) -> Bool {
  let uppercased = string.uppercase(remark)
  uppercased == remark
}

pub fn is_question(remark:String) -> Bool {
  string.trim_right(remark) |> string.ends_with("?")
}
pub fn is_silence(remark:String) -> Bool {
  let trimmed_length = string.trim(remark) |> string.length
  trimmed_length == 0
}

pub fn is_non_letters(remark: String) -> Bool {
  let assert Ok(a_int) = string.to_utf_codepoints("a") |> list.map(string.utf_codepoint_to_int) |> list.first()
  let assert Ok(z_int) = string.to_utf_codepoints("z") |> list.map(string.utf_codepoint_to_int) |> list.first()
  let remark_as_ints = string.to_utf_codepoints(string.lowercase(remark)) |> list.map(string.utf_codepoint_to_int)
  let letters = remark_as_ints |> list.filter(fn(i) { a_int <= i }) |> list.filter(fn(j) {j <= z_int})
  list.length(letters) == 0
}
