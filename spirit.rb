require 'gosu'

class Spirit
  attr_reader :image
  attr_writer :x,
              :y,
              :vel_x,
              :vel_y

  def initialize(window, x = 0, y = 0)
    @image = Gosu::Image.new(window, 'media/test_spirit.png', false)
    @x = x
    @y = y
  end

  def movement_rate
    2
  end

  def move_right
    @x += movement_rate
  end

  def move_left
    @x -= movement_rate
  end

  def move_up
    @y -= movement_rate
  end

  def move_down
    @y += movement_rate
  end

  def draw
    image.draw_rot(@x, @y, 1, 0)
  end
end
