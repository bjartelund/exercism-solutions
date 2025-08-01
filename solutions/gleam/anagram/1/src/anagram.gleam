import gleam/string
import gleam/list
pub fn find_anagrams(word: String, candidates: List(String)) -> List(String) {
  let reference = string.lowercase(word)
  list.filter(candidates,fn(candidate) {is_not_same(reference,candidate)}) |> list.filter(fn(candidate) {is_anagram(reference,candidate)})
}

pub fn is_not_same(reference, word) -> Bool{
  let lowercase_word = string.lowercase(word)
  reference != lowercase_word
}

pub fn is_anagram(reference: String, word: String) -> Bool {
  let lowercase_word = string.lowercase(word)

  let letters_in_reference = string.to_graphemes(reference) |> list.sort(string.compare)
  let letters_in_word = string.to_graphemes(lowercase_word) |> list.sort(string.compare)
  letters_in_reference == letters_in_word
}