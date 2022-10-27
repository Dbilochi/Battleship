require_relative '../lib/battleship'

describe Battleship do
  let(:player1) { double("Player") }
  let(:player2) { double("Player") }

  it 'should create battleship with two players' do
    bat = Battleship.new(player1, player2)

    expect(bat.player1).not_to be_nil
    expect(bat.player2).not_to be_nil
  end
  
end