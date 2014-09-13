require 'gosu'

class GameWindow < Gosu::Window
  attr_reader :background_color,
              :width, 
              :height, 
              :left_base,
              :right_base
  def initialize
    @width  = 1280
    @height = 1024
    @background_color = Gosu::Color::WHITE 
    puts self
    super width, height, true
    @left_base  = Gosu::Image.new(self, "media/base1smaller.png", false)
    @right_base = Gosu::Image.new(self, "media/base2smaller.png", false)
    self.caption = "Consume Sunlight"
  end

  def update
  end
  
  def draw
    draw_background_color
    draw_left_base
    draw_right_base
  end

  def draw_background_color
    draw_quad(
      0, 0, @background_color,
      width, 0, @background_color,
      0, height, @background_color,
      width, height, @background_color
    )
  end

  def draw_left_base
    left_base.draw(160, 624, 0)
  end

  def draw_right_base
    right_base.draw(768, 624, 0)
  end

  def button_down(id)
    if id == Gosu::KbEscape
      close
    end
  end
end

window = GameWindow.new
window.show
