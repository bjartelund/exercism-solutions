import gleam/regex
import gleam/list
import gleam/string
import gleam/result

pub fn message(log_line: String) -> String {
  split_log_line(log_line).message
}

pub fn log_level(log_line: String) -> String {
  split_log_line(log_line).level
}

pub fn reformat(log_line: String) -> String {
  let log_message = split_log_line(log_line)
  log_message.message <> " (" <> log_message.level <> ")"
}

pub fn split_log_line(log_line: String) -> LogMessage {
  let split = string.split(log_line, ":")
  let level =
    list.first(split)
    |> get_level
  let message =
    list.last(split)
    |> result.lazy_unwrap(fn() -> String { "" })
    |> string.trim
  LogMessage(level, message)
}

pub fn get_level(level_part_result: Result(String, Nil)) -> String {
  let level_part = result.lazy_unwrap(level_part_result, fn() -> String { "" })
  string.replace(level_part, "[", "")
  |> string.replace("]", "")
  |> string.lowercase
}

pub type LogMessage {
  LogMessage(level: String, message: String)
}
