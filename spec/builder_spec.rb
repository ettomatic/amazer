require 'spec_helper'

describe Builder do
  let(:resolution) { 10 }
  let(:maze)       { Maze.new(resolution) }

  subject          { Builder.new }

  describe '#build' do
    it 'returns a maze' do
      expect(subject.build(maze)).to be_a(Maze)
    end

    it 'recursively walks all over the rooms, like the room at NW border' do
      expect(subject.build(maze)[0, 0].doors.size).to be > 0
    end

    it 'recursively walks all over the rooms, like the room at SE border' do
      x = resolution - 1
      y = resolution - 1
      expect(subject.build(maze)[x, y].doors.size).to be > 0
    end
  end
end
