require './lib/ship'
require './lib/board'
require './lib/cell'

cell_1 = @board.cells['A1']
cell_2 = @board.cells['A2']
cell_3 = @board.cells['A3']
cell_4 = @board.cells['A4']
cell_5 = @board.cells['B1']
cell_6 = @board.cells['B2']
cell_7 = @board.cells['B3']
cell_8 = @board.cells['B4']
cell_9 = @board.cells['C1']
cell_10 = @board.cells['C2']
cell_11 = @board.cells['C3']
cell_12 = @board.cells['C4']
cell_13 = @board.cells['D1']
cell_14 = @board.cells['D2']
cell_15 = @board.cells['D3']
cell_16 = @board.cells['D4']


puts o = " " + "1" + "2" + "3" + "4" + "/n"
puts a = 'A' + cell_1.render + cell_2.render + cell_3.render + cell_4.render + '/n'
puts b = 'B' + cell_5.render + cell_6.render + cell_7.render + cell_8.render + '/n'
puts c = 'C' + cell_9.render + cell_10.render + cell_11.render + cell_12.render '/n'
puts d = 'D' + cell_13.render + cell_14.render + cell_15.render + cell_16.render + '/n' 


puts grid
