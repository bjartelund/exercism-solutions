import gleam/queue.{type Queue}
import gleam/string

pub fn is_paired(value: String) -> Bool {
  let brackets = queue.new()
  let chars = string.to_graphemes(value)
  scan(chars, brackets)
}

fn scan(value: List(String), stack: Queue(String)) -> Bool {
  case value {
    [] -> queue.is_empty(stack)
    // Return True if the stack is empty at the end
    [char, ..remaining] ->
      case char {
        "{" | "[" | "(" -> {
          let new_queue = queue.push_back(stack, char)
          scan(remaining, new_queue)
        }
        "}" | "]" | ")" -> {
          let result = queue.pop_back(stack)
          case result {
            Ok(#(value, remaining_stack)) -> {
              case match(value, char) {
                True -> scan(remaining, remaining_stack)
                False -> False
              }
              // Mismatch found, immediately return False
            }
            Error(_) -> False
          }
          // Stack is empty but a closing bracket was found
        }
        _ -> scan(remaining, stack)
      }
  }
  // Ignore non-bracket characters
}

fn match(a: String, b: String) -> Bool {
  case a, b {
    "{", "}" | "(", ")" | "[", "]" -> True
    _, _ -> False
  }
}
