module Amazer
  class Maze
    attr_reader :resolution

    def initialize(resolution, builder: nil, output: nil)
      @resolution = resolution
      @builder    = builder || Builder.new
      @output     = output  || Console.new
      @solver     = Solver.new
    end

    def build
      @builder.build(self)
    end

    def display
      @output.to_s(self)
    end

    def solve
      @solver.solve(self)
    end

    def size
      resolution**2
    end

    def [](x, y)
      return unless x < resolution && y < resolution
      rooms[y][x]
    end

    def random_room
      rnd_x = rand(0..resolution - 1)
      rnd_y = rand(0..resolution - 1)
      rooms[rnd_x][rnd_y]
    end

    def rooms
      return @rooms if defined?(@rooms)

      @rooms = Array.new(resolution) do |y|
        Array.new(resolution) do |x|
          Room.new(x, y, self)
        end
      end
    end

    def start
      self[0,0]
    end

    def exit
      self[resolution - 1, resolution - 1]
    end
  end
end
