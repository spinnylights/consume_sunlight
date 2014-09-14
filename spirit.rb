require 'gosu'

class Spirit
  attr_reader :image,
              :boundary
  attr_accessor :x,
                :y

  def initialize(
    window, 
    x = 0, 
    y = 0,
    boundary = {}
  )
    @image = Gosu::Image.new(window, 'media/test_spirit.png', false)
    @x = x
    @y = y
    @boundary = boundary;
  end

  def movement_rate
    2
  end

  def side_length
    18
  end

  def half_side_length
    side_length / 2
  end

  def move_right
    if (@x + movement_rate) < boundary[:right_x]
      @x += movement_rate
    end
  end

  def move_left
    if (@x - movement_rate) > boundary[:left_x]
      @x -= movement_rate
    end
  end

  def move_up
    if (@y - movement_rate) > boundary[:top_y]
      @y -= movement_rate
    end
  end

  def move_down
    if (@y + movement_rate) < boundary[:bottom_y]
      @y += movement_rate
    end
  end

  def draw
    image.draw_rot(@x, @y, 1, 0)
  end
end
