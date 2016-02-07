require 'spec_helper'

describe Room do
  let(:maze) { Maze.new(10) }

  subject    { maze[x, y] }

  describe '#available_directions' do
    context 'when on the north west border' do
      let(:x) { 0 }
      let(:y) { 0 }

      it 'has a number of available directions' do
        expect(subject.available_directions).to match_array([:east, :south])
      end
    end

    context 'when on the north east border' do
      let(:x) { 9 }
      let(:y) { 9 }

      it 'has a number of available directions' do
        expect(subject.available_directions).to match_array([:west, :north])
      end
    end

    context 'when not close to the border' do
      let(:x) { 1 }
      let(:y) { 1 }

      it 'has a number of available directions' do
        expect(subject.available_directions).to eq([:north, :east, :south, :west])
      end
    end
  end
end
