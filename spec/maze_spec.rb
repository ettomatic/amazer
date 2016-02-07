require 'spec_helper'

describe Maze do
  subject { described_class.new(10) }

  it 'produces a matrix representing a maze of an exact size' do
    expect(subject.size).to eq 100
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
end
