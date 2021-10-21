require './lib/cell'

class Board


  def initialize
    #can we make the below more dynamic?
    @coords = ['A1', 'A2', 'A3', 'A4', 'B1', 'B2', 'B3', 'B4', 'C1', 'C2', 'C3', 'C4', 'D1', 'D2', 'D3', 'D4']

  end

  def cells

    new_hash = {}
    @coords.each do |i|
      #makes i equal key and new cell instance equal value
      new_hash.store(i, cell = Cell.new(i))
      #stores new keyvalue in hash accumulator
    end

    new_hash
  end

  def valid_coordinate?(coordinate)
    @coords.include?(coordinate)
  end
end
