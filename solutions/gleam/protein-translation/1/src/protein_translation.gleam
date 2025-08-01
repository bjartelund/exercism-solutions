import gleam/list
import gleam/string
import gleam/result
pub fn proteins(rna: String) -> Result(List(String), Nil) {
  rna |> to_list |>
    to_chunked_list |> list.map(translate_codon) |>
    list.take_while(fn(y) {y != "STOP"})
|> filter_out_error
  

}

pub fn filter_out_error(sequence: List(String)) -> Result(List(String),Nil) {
  case list.any(sequence,fn(x) {x=="ERR"}) {
    True -> Error(Nil)
    False -> Ok(sequence)
  }
}

pub fn to_list(rna:String) -> List(String) {
  rna |> string.to_graphemes
}

pub fn to_chunked_list(input: List(String)) -> List(List(String)) {
  input |> list.sized_chunk(into: 3)
}
pub fn translate_codon(codon: List(String)) -> String {
  let joined = string.join(codon,"")
  case joined {
    "AUG" -> "Methionine"
    "UUU" -> "Phenylalanine"
    "UUC" -> "Phenylalanine"
    "UUA" -> "Leucine"
    "UUG" -> "Leucine"
    "UCU" -> "Serine"
    "UCC" -> "Serine"
    "UCA" -> "Serine"
    "UCG" -> "Serine"
    "UAU" -> "Tyrosine"
    "UAC" -> "Tyrosine"
    "UGU" -> "Cysteine"
    "UGC" -> "Cysteine"
    "UGG" -> "Tryptophan"
    "UAA" -> "STOP"
    "UAG" -> "STOP"
    "UGA" -> "STOP"
    _ -> "ERR"
  }
}
