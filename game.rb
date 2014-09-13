require 'gosu'

class GameWindow < Gosu::Window
  def initialize
    super 1280, 1024, false
    self.caption = "Consume Sunlight"
  end

  def update
  end
  
  def draw
  end

  def button_down(id)
    if id == Gosu::KbEscape
      close
    end
  end
end

window = GameWindow.new
window.show
