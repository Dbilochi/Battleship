require_relative '../lib/battleship'
require_relative '../lib/fileReaderWriter'

describe Battleship do
  let(:player1) { double("Player") }
  let(:player2) { double("Player") }

  it 'should create battleship with two players' do
    bat = Battleship.new(player1, player2)

    expect(bat.player1).not_to be_nil
    expect(bat.player2).not_to be_nil
  end

  it 'should create file reader instance to read data' do
    bat = Battleship.new(player1, player2)

    expect(bat.file).to be_a FileReaderWriter
  end

  it 'player should call to place ships in the grid on game start' do
    bat = Battleship.new(player1,player2)

    expect(bat.player1).to receive(:create_grid).with(bat.file_data['grid_size'].to_i)
    expect(bat.player1).to receive(:place_ships_in_grid).with(bat.file.format(bat.file_data["p1_ship_positions"]))

    expect(bat.player2).to receive(:create_grid).with(bat.file_data['grid_size'].to_i)
    expect(bat.player2).to receive(:place_ships_in_grid).with(bat.file.format(bat.file_data["p2_ship_positions"]), )

    bat.start_play
  end

  it 'on fire, players should call to target their missiles on opponent ships' do
    bat = Battleship.new(player1,player2)

    expect(bat.player1).to receive(:target).with(bat.file.format(bat.file_data["p2_target_position"]))
    expect(bat.player2).to receive(:target).with(bat.file.format(bat.file_data["p1_target_position"]))

    bat.fire
  end

end