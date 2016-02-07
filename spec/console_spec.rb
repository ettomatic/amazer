require 'spec_helper'

describe Console do
  let(:maze) { Maze.new(10).build }
  subject    { described_class.new }

  describe '#puts' do
    it 'outputs a text representation of the maze' do
      puts subject.to_s(maze)
      expect(subject.to_s(maze)).to be_a(String)
    end
  end
end
