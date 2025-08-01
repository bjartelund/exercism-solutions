import gleam/int
import gleam/string
import gleam/list
pub fn convert(number: Int) -> String {
  let digits = number |> to_4_digit_string |> string.to_graphemes 
  let main_numerals = ["M","C","X","I"]
  let half_numerals = ["","D","L","V"]
  let next_numeral = ["","M","C","X"]
  let assist_numerals = list.zip(half_numerals,next_numeral)
  let numerals = list.zip(main_numerals,assist_numerals)
  let nested = list.zip(digits,numerals)
  let basic_approach = list.zip(digits,main_numerals)
  let assert Ok(ones) = list.last(digits)
  nested |> list.map(handle) |> string.join("")
}

pub fn handle(input: #(String,#(String,#(String,String)))) -> String {
  let assert Ok(number) =  int.parse(input.0)
  let numeral = {input.1}.0
  let half_numeral = {{input.1}.1}.0
  let next_numeral = {{input.1}.1}.1
  case number {
    i if i < 4 -> string.repeat(numeral,number)
    4 -> numeral <> half_numeral
    5 -> half_numeral
    i if i < 9 -> half_numeral <> string.repeat(numeral,number-5)
    9 -> numeral <> next_numeral
}
}

pub fn handle_digit( input: #(String,String)) -> String {
    let assert Ok(number) =  int.parse(input.0)
    string.repeat(input.1,number)
}

//pub fn handle_digit(digit:String, numeral: String) -> String {
//    let assert Ok(number) =  int.parse(digit)
//    string.repeat(numeral,number)
//}

pub fn handle_ones(digit: String, numeral: String) -> String {
  let assert Ok(number) =  int.parse(digit)
  case number {
    i if i < 4 -> string.repeat(numeral,number)
    4 -> "IV"
    5 -> "V"
    i if i < 9 -> "V" <> string.repeat(numeral,number-5)
    9 -> "IX"
}
  
}

pub fn to_4_digit_string(number: Int) -> String {
  int.to_string(number) |> string.pad_left(4,"0")
}