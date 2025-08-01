import gleam/order.{type Order}
import gleam/list
pub type City {
  City(name: String, temperature: Temperature)
}

pub type Temperature {
  Celsius(Float)
  Fahrenheit(Float)
}

pub fn fahrenheit_to_celsius(f: Float) -> Float {
  {f -. 32. } /. 1.8
}

pub fn compare_temperature(left: Temperature, right: Temperature) -> Order {
  let left_in_celsius = case left {
    Celsius(f) -> f
    Fahrenheit(f) -> fahrenheit_to_celsius(f)
  }
  let right_in_celsius = case right {
    Celsius(f) -> f
    Fahrenheit(f) -> fahrenheit_to_celsius(f)
  }
  let ratio = left_in_celsius /. right_in_celsius
  case ratio {
    i if i >. 1. -> order.Gt
    i if i == 1. -> order.Eq
    i if i <. 1. -> order.Lt
  }
}
pub fn compare_cities_by_temperature(left: City, right: City) -> Order {
    compare_temperature(left.temperature,right.temperature)
}

pub fn sort_cities_by_temperature(cities: List(City)) -> List(City) {
  list.sort(cities,compare_cities_by_temperature)
}
