require_relative '../lib/player'

describe Player do
  it 'should create grid of given size' do
    player = Player.new

    grid = player.create_grid(5)

    expect(grid.length).to eq 5
  end

  it 'should place ship on a given position in grid' do
    player = Player.new
    grid = player.create_grid(5)
    x_axis = 0
    y_axis = 1

    player.place_ships_in_grid([[x_axis, y_axis]])

    expect(grid[x_axis][y_axis]).to eq Player::ALIVE
  end

  it 'should HIT ship if ship is in target position' do
    player = Player.new
    grid = player.create_grid(5)
    x_axis = 0
    y_axis = 1
    target_x_axis = 0
    target_y_axis = 1
    player.place_ships_in_grid([[x_axis, y_axis]])

    player.target([[target_x_axis,target_y_axis]])

    expect(grid[target_x_axis][target_y_axis]).to eq Player::HIT
  end
end