require 'gosu'
require 'texplay'

class UnTree
  attr_reader :x, :y, :image

  def initialize(window, x, y, width, height, color = :black)
    @x = x
    @y = y
    @box = TexPlay.create_image(window, width, height)
    @color = color
    @box.fill 0, 0, color: @color
  end

  def draw
    @box.draw(@x, @y, UnTree.z_order) 
    make_transparent(0, 0, 100, 100)
  end

  def make_transparent(left_x, top_y, right_x, bottom_y)
    left_x = left_x - x
    right_x = right_x - x
    top_y = top_y - y
    bottom_y = bottom_y - y
    @box.rect left_x, top_y, right_x, bottom_y, color: [255, 255, 255, 0], fill: true
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
