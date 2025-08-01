import gleam/list
import gleam/string

pub fn recite(inputs: List(String)) -> String {
  case inputs {
    [] -> ""
    [x] -> special_case(x)
    _ -> general_case(inputs)
  }
}

fn special_case(input: String) -> String {
  "And all for the want of a " <> input <> "."
}

fn general_case(inputs: List(String)) -> String {
  let pairs = list.window_by_2(inputs)
  let sentences = list.map(pairs, build_sentence)
  let assert Ok(last) = list.first(inputs)
  let all_together = list.append(sentences, [special_case(last)])
  string.join(all_together, "\n")
}

fn build_sentence(words: #(String, String)) -> String {
  "For want of a " <> words.0 <> " the " <> words.1 <> " was lost."
}
