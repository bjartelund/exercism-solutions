import gleam/list
import gleam/string

pub fn slices(input: String, size: Int) -> Result(List(String), Error) {
  let input_list = string.to_graphemes(input)
  let input_length = list.length(input_list)
  case input_length {
    0 -> Error(EmptySeries)
    _ ->
      case size {
        0 -> Error(SliceLengthZero)
        i if i < 0 -> Error(SliceLengthNegative)
        _ ->
          case input_length - size {
            i if i < 0 -> Error(SliceLengthTooLarge)
            _ ->
              Ok(
                list.window(input_list, size)
                |> list.map(fn(digits) { string.join(digits, "") }),
              )
          }
      }
  }
}

pub type Error {
  EmptySeries
  SliceLengthTooLarge
  SliceLengthNegative
  SliceLengthZero
}
