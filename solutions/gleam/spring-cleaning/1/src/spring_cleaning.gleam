import gleam/string
import gleam/list
pub fn extract_error(problem: Result(a, b)) -> b {
  let assert Error(value) = problem
  value
}

pub fn remove_team_prefix(team: String) -> String {
  string.replace(team,"Team ","")
}

pub fn split_region_and_team(combined: String) -> #(String, String) {
  let splitted = string.split(combined,",")
  let assert Ok(region) = list.first(splitted)
  let assert Ok(team) = list.last(splitted)
  let team_without_prefix= team |> remove_team_prefix
  #(region,team_without_prefix)
}
