pub fn equilateral(a: Float, b: Float, c: Float) -> Bool {
  a == b && b == c && triangle_check(a, b, c)
}

pub fn isosceles(a: Float, b: Float, c: Float) -> Bool {
  { a == b || b == c || a == c } && triangle_check(a, b, c)
}

pub fn scalene(a: Float, b: Float, c: Float) -> Bool {
  a != b && b != c && a != c && triangle_check(a, b, c)
}

fn triangle_check(a: Float, b: Float, c: Float) -> Bool {
  { a +. b >=. c }
  && { b +. c >=. a }
  && { a +. c >=. b }
  && { a != 0.0 && b != 0.0 && c != 0.0 }
}
