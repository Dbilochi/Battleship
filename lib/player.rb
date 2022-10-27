require_relative 'ship'
class Player

  ALIVE = 'B'
  HIT = 'X'
  MISS = 'O'
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

  def target(positions)
    @hit=0
    positions.each do |g|
      if ship_found_in_target_position(g[0].to_i,g[1].to_i)
        hit_the_ship(g[0].to_i,g[1].to_i)
      else
        miss_the_ship(g[0].to_i,g[1].to_i)
      end
    end
    [@grid, @hit]
  end

  private

  def ship_found_in_target_position(x,y)
    @grid[x][y] == ALIVE
  end

  def hit_the_ship(x,y)
    @grid[x][y] = HIT
    @hit += 1
  end

  def miss_the_ship(x,y)
    @grid[x][y] = MISS
  end
end

