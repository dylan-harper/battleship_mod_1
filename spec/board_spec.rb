require 'rspec'
require './lib/board'

Spec.describe Cell do
  before(:each) do
    @board = Board.new
    
  end
