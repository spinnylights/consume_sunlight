require 'gosu'

class UnTree
  attr_reader :x, :y, :image

  def initialize(window, x, y)
    @x = x
    @y = y
    @image = Gosu::Image.new(window, 'media/un_tree.png', false)
  end

  def draw
    image.draw(x, y, 1) 
  end

  def self.z_order
    0.2
  end

  def self.x_ys(
    left_x,
    right_x,
    top_y,
    bottom_y
  )
    x_ys = []
    x = left_x
    y = top_y
    while ( y < bottom_y )
      while ( x < right_x )
        x_ys << { x: x, y: y }
        x += 40
      end
      y += 40
      x = left_x 
    end
    x_ys
  end
end
