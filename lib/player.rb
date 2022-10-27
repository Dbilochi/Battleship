class Player
  def create_grid(grid_size)
    @grid ||= Array.new(grid_size) { Array.new(grid_size) { '-' } }
  end
end

