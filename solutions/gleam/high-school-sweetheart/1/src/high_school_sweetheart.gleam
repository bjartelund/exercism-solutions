import gleam/string
import gleam/list
pub fn first_letter(name: String) {
  let assert Ok(first) = string.trim(name) |> string.to_graphemes |> list.first
  first
}

pub fn initial(name: String) {
  first_letter(name) |> string.uppercase <> "."
}

pub fn initials(full_name: String) {
  let names = string.split(full_name, " ")
  list.map(names, fn(name) {initial(name)}) |> string.join(" ")
}

pub fn pair(full_name1: String, full_name2: String) {
  "\n     ******       ******\n" <> "   **      **   **      **\n" <> " **         ** **         **\n" <> "**            *            **\n" <> "**                         **\n" <> "**     " <> initials(full_name1,) <> "  +  " <> initials(full_name2) <> "     **\n" <> " **                       **\n" <> "   **                   **\n" <> "     **               **\n" <> "       **           **\n" <> "         **       **\n" <> "           **   **\n" <> "             ***\n" <> "              *\n"
}

