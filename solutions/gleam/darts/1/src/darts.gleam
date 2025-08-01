import gleam/float
pub fn score(x: Float, y: Float) -> Int {
  let radii = hypothenus(x,y)
  case radii {
    i if i >. 10. -> 0
    i if i >. 5. -> 1
    i if i >. 1. -> 5
    i if i <=. 1.  -> 10
  }
}

pub fn hypothenus(x:Float, y: Float) -> Float {
  let assert Ok(hypo) = float.square_root(x *. x +. y *. y)
  hypo
}
