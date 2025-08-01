import gleam/list
pub fn place_location_to_treasure_location(
  place_location: #(String, Int),
) -> #(Int, String) {
  #(place_location.1,place_location.0)
}

pub fn treasure_location_matches_place_location(
  place_location: #(String, Int),
  treasure_location: #(Int, String),
) -> Bool {
  place_location_to_treasure_location(place_location) == treasure_location
}

pub fn count_place_treasures(
  place: #(String, #(String, Int)),
  treasures: List(#(String, #(Int, String))),
) -> Int {
  let place_location = place.1
  list.filter(treasures, fn(treasure) {treasure_location_matches_place_location(place_location,treasure.1)}) |> list.length 
}

pub fn special_case_swap_possible(
  found_treasure: #(String, #(Int, String)),
  place: #(String, #(String, Int)),
  desired_treasure: #(String, #(Int, String)),
) -> Bool {
  case found_treasure {
    #("Brass Spyglass",_) -> case place{
      #("Abandoned Lighthouse", _) -> True
      _ -> False
    }
    #("Amethyst Octopus",_) -> case desired_treasure {
      #("Crystal Crab",_) -> True
      #("Glass Starfish",_) -> True
      _ -> False
    }
    #("Vintage Pirate Hat",_) -> case desired_treasure {
      #("Model Ship in Large Bottle",_) -> case place {
        #("Harbor Managers Office",_) -> True
        _ -> False
      }
      #("Antique Glass Fishnet Float",_) -> True
      _ -> False
    }
    _ -> False
}
}
