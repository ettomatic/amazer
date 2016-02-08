require 'spec_helper'

module Amazer
  describe Console do
    let(:maze) { Maze.new(10).build }
    subject    { described_class.new }

    describe '#to_s' do
      it 'outputs a text representation of the maze' do
        puts subject.to_s(maze)
        expect(subject.to_s(maze)).to be_a(String)
      end

      it 'prints an S to display the Start' do
        out = subject.to_s(maze)
        start_char = out.lines[1][2]
        expect(start_char).to eq('S')
      end

      it 'prints an E to display the Exit' do
        out = subject.to_s(maze)
        end_char = out.lines[-2][-4]
        expect(end_char).to eq('E')
      end
    end
  end
end
