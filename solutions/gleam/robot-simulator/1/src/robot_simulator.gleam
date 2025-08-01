import gleam/list
import gleam/string

pub type Robot {
  Robot(direction: Direction, position: Position)
}

pub type Direction {
  North
  East
  South
  West
}

pub type Rotation {
  Left
  Right
}

pub type Position {
  Position(x: Int, y: Int)
}

pub fn create(direction: Direction, position: Position) -> Robot {
  Robot(direction, position)
}

fn rotate(robot: Robot, rotation: Rotation) -> Robot {
  case rotation {
    Left ->
      case robot.direction {
        North -> Robot(..robot, direction: West)
        East -> Robot(..robot, direction: North)
        South -> Robot(..robot, direction: East)
        West -> Robot(..robot, direction: South)
      }
    Right ->
      case robot.direction {
        North -> Robot(..robot, direction: East)
        East -> Robot(..robot, direction: South)
        South -> Robot(..robot, direction: West)
        West -> Robot(..robot, direction: North)
      }
  }
}

fn advance(robot: Robot) -> Robot {
  case robot.direction {
    North ->
      Robot(
        ..robot,
        position: Position(..robot.position, y: robot.position.y + 1),
      )
    East ->
      Robot(
        ..robot,
        position: Position(..robot.position, x: robot.position.x + 1),
      )
    West ->
      Robot(
        ..robot,
        position: Position(..robot.position, x: robot.position.x - 1),
      )
    South ->
      Robot(
        ..robot,
        position: Position(..robot.position, y: robot.position.y - 1),
      )
  }
}

fn split(instructions: String) -> List(String) {
  string.to_graphemes(instructions)
}

fn handle(robot: Robot, instruction: String) -> Robot {
  case instruction {
    "R" -> rotate(robot, Right)
    "L" -> rotate(robot, Left)
    _ -> advance(robot)
  }
}

pub fn move(
  direction: Direction,
  position: Position,
  instructions: String,
) -> Robot {
  let robot = create(direction, position)

  let operations = instructions |> split
  list.fold(operations, robot, fn(robot, instruction) {
    handle(robot, instruction)
  })
}
