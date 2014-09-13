require 'gosu'

class GameWindow < Gosu::Window
  attr_reader :background_color, :width, :height
  def initialize
    @width  = 1280
    @height = 1024
    @background_color = Gosu::Color::WHITE 
    super width, height, true
    self.caption = "Consume Sunlight"
  end

  def update
  end
  
  def draw
    draw_quad(
      0, 0, @background_color,
      width, 0, @background_color,
      0, height, @background_color,
      width, height, @background_color
    )
  end

  def button_down(id)
    if id == Gosu::KbEscape
      close
    end
  end
end

window = GameWindow.new
window.show
