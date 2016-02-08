require 'spec_helper'

module Amazer
  describe Solver do
    let(:size) { 8 }
    let(:maze) { Maze.new(size).build }

    subject { described_class.new }

    it 'return a solved maze' do
      expect(subject.solve(maze)).to be_a Maze
    end

    it 'returns which rooms are member of the path' do
      expect(subject.solve(maze)[0,0].on_exit_path).to be true
    end
  end
end
