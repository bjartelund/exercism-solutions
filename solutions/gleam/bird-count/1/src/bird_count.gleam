import gleam/list
pub fn today(days: List(Int)) -> Int {
  case days {
    [] -> 0
    [n] -> n
    [n,..] -> n
    }
  }

pub fn increment_day_count(days: List(Int)) -> List(Int) {
  case days {
  [] -> [1]
  [n, ..rest] -> [n+1,..rest]
  }
}

pub fn has_day_without_birds(days: List(Int)) -> Bool {
  case days {
    [] -> False
    [n, ..rest] -> case n {
      0 -> True
      _ -> has_day_without_birds(rest)
    }
  }
}

pub fn total(days: List(Int)) -> Int {
  case days {
    [] -> 0
    [n, ..rest] -> n + total(rest)
  }
}

pub fn busy_days(days: List(Int)) -> Int {
  case days {
    []  -> 0
    [n, ..rest] -> case n {
      i if i > 4 -> 1 + busy_days(rest)
      _ -> busy_days(rest)
    }
  }
}
