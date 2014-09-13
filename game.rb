require 'gosu'
require_relative './spirit'

class GameWindow < Gosu::Window
  attr_reader :background_color,
              :width, 
              :height, 
              :left_base,
              :right_base,
              :spirit
  def initialize
    @width  = 1280
    @height = 1024
    @background_color = Gosu::Color::WHITE 
    puts self
    super width, height, true
    @left_base  = Gosu::Image.new(self, "media/base1smaller.png", false)
    @right_base = Gosu::Image.new(self, "media/base2smaller.png", false)
    @spirit = Spirit.new( self )
    self.caption = "Consume Sunlight"
  end

  def update
    if (button_down? Gosu::KbLeft) or (button_down? Gosu::GpLeft)
      spirit.move_left
    end
    if (button_down? Gosu::KbRight) or (button_down? Gosu::GpRight)
      spirit.move_right
    end
    if (button_down? Gosu::KbUp) or (button_down? Gosu::GpUp)
      spirit.move_up
    end
    if (button_down? Gosu::KbDown) or (button_down? Gosu::GpDown)
      spirit.move_down
    end
  end
  
  def draw
    draw_background_color
    draw_left_base
    draw_right_base
    spirit.draw
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
