module Amazer
  class Room
    attr_reader :maze, :x, :y
    attr_accessor :doors

    def initialize(x, y, maze)
      @x     = x
      @y     = y
      @maze  = maze
      @doors = {}
    end

    def random_target
      t = available_directions.sample
      send(t)
    end

    def available_directions
      @available_directions ||= Array.new.tap do |a|
        a << :north if @y.between?(1, maze.resolution - 1)
        a << :east  if @x < maze.resolution - 1
        a << :south if @y < maze.resolution - 1
        a << :west  if @x.between?(1, maze.resolution - 1)
      end
    end

    def available_doors
      d = []
      @doors.each do |door, _|
        d << :north if door == north
        d << :east  if door == east
        d << :south if door == south
        d << :west  if door == west
      end
      d
    end

    def open_door_with(room)
      @doors[room]     = 1
      room.doors[self] = 1
    end

    private

    def north
      maze[@x, @y - 1]
    end

    def east
      maze[@x + 1, @y]
    end

    def south
      maze[@x, @y + 1]
    end

    def west
      maze[@x - 1, @y]
    end
  end
end
