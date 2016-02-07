require 'spec_helper'

describe Maze do
  subject { described_class.new(10) }

  describe '#size' do
    it 'returns the number of rooms composing the maze' do
      expect(subject.size).to eq 100
    end
  end

  describe '#[]' do
    it 'returns single rooms' do
      room = subject[1, 0]
      expect(room).to be_a(Room)
      expect(room.x).to eq 1
      expect(room.y).to eq 0
    end

    it 'return nil if out of the grid' do
      expect(subject[10, 10]).to be_nil
    end
  end

  describe '#random_room' do
    it 'returns a random room' do
      expect(subject.random_room).to be_a(Room)
    end
  end

  describe '#rooms' do
    it 'produces rooms structured as an array of arrays' do
      expect(subject.rooms.size).to eq(10)
      expect(subject.rooms[0].size).to eq(10)
    end
  end

  describe '#build' do
    it 'return the built maze ready to be explored' do
      expect(subject.build).to be_a(Maze)
    end
  end
end
