require 'gosu'
require_relative './spirit'

class GameWindow < Gosu::Window
  attr_reader :background_color,
              :width, 
              :height, 
              :left_base,
              :right_base,
              :spirit_left,
              :spirit_right
  def initialize
    @width  = 1280
    @height = 1024
    @background_color = Gosu::Color::WHITE 
    puts self
    super width, height, true
    @left_base  = Gosu::Image.new(self, "media/base1smaller.png", false)
    @right_base = Gosu::Image.new(self, "media/base2smaller.png", false)
    @spirit_left = Spirit.new( self, 319, 624)
    @spirit_right = Spirit.new( self, 927, 624)
    self.caption = "Consume Sunlight"
  end

  def exec_spirit_left_movement
    if (button_down? Gosu::KbA)
      spirit_left.move_left
    end
    if (button_down? Gosu::KbD)
      spirit_left.move_right
    end
    if (button_down? Gosu::KbW)
      spirit_left.move_up
    end
    if (button_down? Gosu::KbS)
      spirit_left.move_down
    end
  end

  def exec_spirit_right_movement
    if (button_down? Gosu::KbLeft) or (button_down? Gosu::GpLeft)
      spirit_right.move_left
    end
    if (button_down? Gosu::KbRight) or (button_down? Gosu::GpRight)
      spirit_right.move_right
    end
    if (button_down? Gosu::KbUp) or (button_down? Gosu::GpUp)
      spirit_right.move_up
    end
    if (button_down? Gosu::KbDown) or (button_down? Gosu::GpDown)
      spirit_right.move_down
    end
  end

  def update
    exec_spirit_left_movement
    exec_spirit_right_movement
  end
  
  def draw
    draw_background_color
    draw_left_base
    draw_right_base
    spirit_left.draw
    spirit_right.draw
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
