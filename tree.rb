require 'gosu'
require 'texplay'

class Tree
  attr_reader :x,
              :y,
              :img
  def initialize(window, x, y)
    @x = x
    @y = y
    @img = Gosu::Image.new(window, "media/top1_small.png", false) 
  end

  def draw
    img.draw(x, y, 0.1)
  end
end
