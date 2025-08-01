pub fn is_leap_year(year: Int) -> Bool {
  evenly_divided(year,4) && !evenly_divided(year,100) || evenly_divided(year,400)
}

fn evenly_divided(year: Int, divisor: Int) -> Bool {
  let remainder = year % divisor
  remainder == 0
}