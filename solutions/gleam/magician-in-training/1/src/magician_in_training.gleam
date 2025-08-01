import gleam/queue.{type Queue}

pub fn insert_top(queue: Queue(Int), card: Int) {
  queue.push_back(queue, card)
}

pub fn remove_top_card(queue: Queue(Int)) -> Queue(Int) {
  case queue.is_empty(queue) {
    True -> queue.new()
    False -> {
      let assert Ok(#(_value, remaining_queue)) = queue.pop_back(queue)
      remaining_queue
    }
  }
}

pub fn insert_bottom(queue: Queue(Int), card: Int) -> Queue(Int) {
  queue.push_front(queue, card)
}

pub fn remove_bottom_card(queue: Queue(Int)) -> Queue(Int) {
  case queue.is_empty(queue) {
    True -> queue.new()
    False -> {
      let assert Ok(#(_value, remaining_queue)) = queue.pop_front(queue)
      remaining_queue
    }
  }
}

pub fn check_size_of_stack(queue: Queue(Int), target: Int) -> Bool {
  queue.length(queue) == target
}
