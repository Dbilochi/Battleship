require_relative 'FileReaderWriter'
class Battleship

  attr_reader :player1, :player2, :file, :file_data

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2

    @file = FileReaderWriter.new
    @file_data = @file.read_and_get_file_data
  end

  def start_play
    @player1.create_grid(@file_data['grid_size'].to_i)
    @player2.create_grid(@file_data['grid_size'].to_i)
    @player1.place_ships_in_grid(@file.format(@file_data["p1_ship_positions"]))
    @player2.place_ships_in_grid(@file.format(@file_data["p2_ship_positions"]))
  end


end