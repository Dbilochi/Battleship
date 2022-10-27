require_relative 'FileReaderWriter'
class Battleship

  attr_reader :player1, :player2, :file

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2

    @file = FileReaderWriter.new
  end


end