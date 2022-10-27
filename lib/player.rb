require_relative 'ship'
class Player

  ALIVE = 'B'
  def create_grid(grid_size)
    @grid ||= Array.new(grid_size) { Array.new(grid_size) { '-' } }
  end

  def place_ships_in_grid(positions)
    p_ships=[]
    positions.each { |p| p_ships << Ship.new(p[0].to_i,p[1].to_i) }
    @grid.each_with_index do |p,i|
      p.each_with_index do |q,j|
        p_ships.each do|s|
          if (s.x_axis === i) && (s.y_axis === j)
            @grid[i][j] = ALIVE
          end
        end
      end
    end
  end

end

