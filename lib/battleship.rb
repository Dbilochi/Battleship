require_relative 'FileReaderWriter'
require_relative 'Player'
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

  def fire
    missile_position_p1 = @file.format(@file_data["p2_target_position"])
    missile_position_p2 = @file.format(@file_data["p1_target_position"])

    @grid1, @hit1 = @player1.target(missile_position_p1)
    @grid2, @hit2 = @player2.target(missile_position_p2)
  end

  def output
    @file.write({'Player1':[@grid1, @hit1], 'Player2': [@grid2,@hit2]}, battle_result)
  end


  def battle_result
    if @hit1 == @hit2
      'It is a draw'
    elsif @hit1 > @hit2
      'Player 1 wins'
    elsif @hit2 > @hit1
      'Player 2 wins'
    end
  end

end

bat = Battleship.new(Player.new, Player.new)
bat.start_play
bat.fire
bat.output
