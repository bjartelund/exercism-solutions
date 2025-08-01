import gleam/float
import gleam/int
import gleam/result
import gleam/iterator
import gleam/list
pub type Error {
  InvalidSquare
}

pub fn square(square: Int) -> Result(Int, Error) {
  let power = square - 1
  case power {
    i if i >= 64  -> Error(InvalidSquare)
    i if i < 0 -> Error(InvalidSquare)
    _ -> int.power(2,int.to_float(power)) |> result.map(fn(x) { float.round(x) } ) |> result.map_error( fn(_) {InvalidSquare})
  }
}

pub fn total() -> Int {
  let mapped_squares =  iterator.range(0,64) |> iterator.map(fn(x) {square(x)}) |> iterator.to_list |> result.partition 
  let assert Ok(sum) = case mapped_squares {
    #(a,_) -> a |> list.reduce(fn(acc,x) {acc+x})
    _ -> Error(Nil)
  } 
sum
}
