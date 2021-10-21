require './lib/cell'

class Board

def initialize
  @cells = %w[A1 A2 A3 A4 B1 B2 B3 B4 C1 C2 C3 C4 D1 D2 D3 D4]

end

def cells
  new_hash = {}
  @cells.each do |cell|
    new_hash|1..4 && A..D| = Cell.new
 end
new_hash

  # for c in @cells do
  #   new_hash << Cell.new(coordinate)
  # end
  # new_hash
end

end
