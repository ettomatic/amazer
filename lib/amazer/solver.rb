module Amazer
  class Solver
    def solve(maze)
      count   = 0
      start   = maze.start
      acc     = { start => count }
      queue   = [start]
      scanned = walk_maze(queue, acc, 0)

      find_path(maze, scanned)
    end

    private

    def find_path(maze, scanned)
      room = maze.exit
      until room == maze.start
        next_room = room.doors.keys.find { |n| scanned[n] < scanned[room] }
        next_room.on_exit_path = true
        room = next_room
      end

      maze
    end

    def walk_maze(queue, acc, count)
      return acc if queue.empty?

      batch = []
      queue.each do |room|
        room.doors.each do |r, _|
          next if acc[r]
          count += 1
          acc[r] = count
          batch << r
        end
      end
      walk_maze(batch, acc, count)
    end
  end
end
