import gleam/iterator
import gleam/string
import gleam/int
import gleam/list

pub fn convert(number: Int) -> String {
  let factors = [3,5,7]
 list.map(factors,fn(x) {get_sound(number,x)}) |> empty_check(number)
}

pub fn empty_check(input: List(String), number:Int) -> String {
  let joined = string.join(input,"")
  case string.length(joined) {
    0 -> int.to_string(number)
    _  -> joined
  }
  
}

pub fn get_sound(number: Int, divisor: Int) -> String{
  let is_factor = is_a_factor(divisor, number)
  case is_factor {
    True -> case divisor {
      3 -> "Pling"
      5 -> "Plang"
      7 -> "Plong"
    }
    False -> ""
  }
  }


pub fn is_a_factor(divisor: Int,number: Int ) -> Bool {
  let remainder = number % divisor
  remainder == 0
}
