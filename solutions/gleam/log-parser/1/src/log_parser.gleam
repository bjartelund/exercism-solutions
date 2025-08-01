import gleam/regex
import gleam/list
import gleam/option.{Option, Some, None}
pub fn is_valid_line(line: String) -> Bool {
  let assert Ok(re) = regex.from_string("\\[INFO|WARNING|DEBUG|ERROR\\]\\s.*$")
  regex.check(re,line)
}

pub fn split_line(line: String) -> List(String) {
  let assert Ok(re) = regex.from_string("<[~*=-]*>")
  regex.split(re,line)
}

pub fn tag_with_user_name(line: String) -> String {
  let assert Ok(re) = regex.from_string("User\\s*(\\S*)")
  let matches = regex.scan(re,line)
  case matches {
    [first_element,..rest] -> {case first_element.submatches {
      [first_match,..rest] -> {case first_match {
      Some(match) -> "[USER] " <> match <> " " <> line
      _ -> line
      }}
      _ -> line
    }}
    _ -> line
}
  }
