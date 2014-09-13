require 'gosu'

class Spirit
  attr_reader :image
  attr_writer :x,
              :y,
              :vel_x,
              :vel_y

  def initialize(window)
    @image = Gosu::Image.new(window, 'media/test_spirit.png', false)
    @x = @y = @vel_x = @vel_y = 0.0
  end

  def move_right
    @x += 1
  end

  def move_left
    @x -= 1
  end

  def move_up
    @y -= 1
  end

  def move_down
    @y += 1
  end

  def draw
    image.draw_rot(@x, @y, 1, 0)
  end
end
