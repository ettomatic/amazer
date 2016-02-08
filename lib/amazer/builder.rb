module Amazer
  # Or maybe it should be called Digger, this is what it does..
  class Builder
    def build(maze)
      starting_room = maze.random_room
      open_doors(starting_room, maze.size)
      maze
    end

    private

    def open_doors(room, size)
      walked = 1
      while walked < size
        target = room.random_target
        if target.doors.empty?
          room.open_door_with(target)
          walked += 1
        end
        room = target
      end
    end
  end
end
