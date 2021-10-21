require './lib/cell'

class Board

  def initialize(cells = nil)
    @cells = cells
  end

  def cells
    @cells.map do |cell|
      board = Board.new
      cell.new(coordinate)
  end

  end

  def cells_instances
    @cell_instances ||= cells
  end

end
