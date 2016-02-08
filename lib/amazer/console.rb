module Amazer
  class Console
    def to_s(maze)
      @maze = maze
      [top, rows].join("\n")
    end

    private

    def top
      '+' + '---+' * @maze.resolution
    end

    def rows
      output = ''
      output << @maze.rooms.map { |row| draw_row(row) }.join
    end

    def draw_row(row)
      output = '|'
      output << row.map { |room| draw_east_wall(room) }.join
      output << "\n"
      output << row.map { |room| draw_south_wall(room) }.join
      output << "+\n"
    end

    def draw_east_wall(room)
      if room.available_doors.include?(:east)
        '    '
      else
        '   |'
      end
    end

    def draw_south_wall(room)
      if room.available_doors.include?(:south)
        '+   '
      else
        '+---'
      end
    end
  end
end
