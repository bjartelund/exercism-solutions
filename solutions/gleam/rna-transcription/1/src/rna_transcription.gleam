import gleam/string
import gleam/result
import gleam/list
pub fn to_rna(dna: String) -> Result(String, Nil) {
  string.to_graphemes(dna) |>list.map (translate) |> nil_check
}

pub fn nil_check(input:List(Result(String,Nil))) -> Result(String,Nil) {
  case result.all(input){
    Ok(elements) -> Ok(string.join(elements,""))
    Error(_) -> Error(Nil)
  }

}

pub fn translate(base: String) -> Result(String, Nil) {
  case base {
    "G" -> Ok("C")
    "C" -> Ok("G")
    "T" -> Ok("A")
    "A" -> Ok("U")
    _ -> Error(Nil)
  }
}