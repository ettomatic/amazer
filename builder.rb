# Or maybe it should be called Digger, this is what it does..
class Builder
  def build(maze)
    starting_room = maze.random_room
    open_doors(starting_room, maze.size - 1)
    maze
  end

  private

  def open_doors(room, remaining)
    if remaining > 0
      target = room.random_target
      if target.doors.empty?
        room.open_door_with(target)
        remaining -= 1
      end
      open_doors(target, remaining)
    end
  end
end
