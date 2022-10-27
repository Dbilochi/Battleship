require_relative '../lib/player'

describe Player do
  it 'should create grid of given size' do
    player = Player.new

    grid = player.create_grid(5)

    expect(grid.length).to eq 5
  end
end