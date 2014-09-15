require 'gosu'
require 'texplay'
require_relative './spirit'
require_relative './un_tree'
require_relative './tree'

class GameWindow < Gosu::Window
  attr_reader :background_color,
              :width, 
              :height, 
              :left_base,
              :right_base,
              :spirit_left,
              :spirit_right,
              :left_untree,
              :right_untree,
              :left_tree,
              :right_tree

  def initialize
    @width  = 1280
    @height = 1024
    @background_color = Gosu::Color::WHITE 
    puts self
    super width, height, false
    @left_base  = Gosu::Image.new(self, "media/base1smaller.png", false)
    @right_base = Gosu::Image.new(self, "media/base2smaller.png", false)
    @spirit_left = Spirit.new(
      self,
      319,
      658,
      {
        left_x: 91,
        right_x: 541,
        top_y: 130,
        bottom_y: 664
      }
    )
    @spirit_right = Spirit.new( 
      self,
      927,
      658,
      {
        left_x: 700,
        right_x: 1150,
        top_y: 130,
        bottom_y: 664 
      }
    )
    @tree_revealing_quads = []
    @left_untree = UnTree.new(self, 84, 130, 541, 534)
    @right_untree = UnTree.new(self, 694, 130, 541, 534)
    @left_tree = Tree.new(self, 84, 130)
    @right_tree = Tree.new(self, 693, 130)
    self.caption = "Consume Sunlight"
  end

  def exec_spirit_left_movement
    if (button_down? Gosu::KbA)
      spirit_left.move_left
      reveal_tree(spirit_left, left_untree)
    end
    if (button_down? Gosu::KbD)
      spirit_left.move_right
      reveal_tree(spirit_left, left_untree)
    end
    if (button_down? Gosu::KbW)
      spirit_left.move_up
      reveal_tree(spirit_left, left_untree)
    end
    if (button_down? Gosu::KbS)
      spirit_left.move_down
      reveal_tree(spirit_left, left_untree)
    end
  end

  def exec_spirit_right_movement
    if (button_down? Gosu::KbLeft) or (button_down? Gosu::GpLeft)
      spirit_right.move_left
      reveal_tree(spirit_right, right_untree)
    end
    if (button_down? Gosu::KbRight) or (button_down? Gosu::GpRight)
      spirit_right.move_right
      reveal_tree(spirit_right, right_untree)
    end
    if (button_down? Gosu::KbUp) or (button_down? Gosu::GpUp)
      spirit_right.move_up
      reveal_tree(spirit_right, right_untree)
    end
    if (button_down? Gosu::KbDown) or (button_down? Gosu::GpDown)
      spirit_right.move_down
      reveal_tree(spirit_right, right_untree)
    end
  end

  def reveal_tree(spirit, untree)
    untree.make_transparent( *spirit.bounding_box ) 

    #@tree_revealing_quads << {
    #  top_left_x: (spirit.x - spirit.half_side_length),
    #  top_left_y: (spirit.y - spirit.half_side_length),
    #  
    #  top_right_x: ( spirit.x + spirit.half_side_length ),
    #  top_right_y: ( spirit.y - spirit.half_side_length ),

    #  bottom_right_x: ( spirit.x + spirit.half_side_length ),
    #  bottom_right_y: ( spirit.y + spirit.half_side_length ),

    #  bottom_left_x: ( spirit.x - spirit.half_side_length ),
    #  bottom_left_y: ( spirit.y + spirit.half_side_length ),
    #  color: Gosu::Color.rgba(0, 255, 255, 255),
    #  z_order: 0.1
    #}
    #@tree_revealing_quads.uniq!
  end

  def draw_tree_reveals
    @tree_revealing_quads.each do |quad|
      draw_quad(
        quad[:top_left_x], quad[:top_left_y],
        quad[:color],

        quad[:top_right_x], quad[:top_right_y],
        quad[:color],

        quad[:bottom_right_x], quad[:bottom_right_y],
        quad[:color],

        quad[:bottom_left_x], quad[:bottom_left_y],
        quad[:color],

        quad[:z_order]
      )
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
    #draw_left_box
    #draw_right_box
    #draw_box(
    #  0, 640,
    #  100, 634,
    #  Gosu::Color::BLUE,
    #  0.8
    #)
    left_untree.draw
    right_untree.draw
    left_untree.make_transparent(291, 629, 341, 664)
    right_untree.make_transparent(901, 629, 951, 664)
    #spirit_left.draw
    #spirit_right.draw
    left_tree.draw
    right_tree.draw
    draw_tree_reveals
  end

  def draw_left_box
    draw_box( 
      0, 640,
      100, 634
    ) 
  end

  def draw_right_box
    draw_box(
      640, 1280,
      100, 634,
      Gosu::Color::GREEN
    )
  end

  def draw_box(
    left_x, right_x,
    top_y, bottom_y,
    color = Gosu::Color::BLACK,
    z_order = UnTree.z_order
  )
    #coords.each do |coord|
    #  untree = UnTree.new(
    #    self,
    #    coord[:x],
    #    coord[:y]
    #  )
    #  untree.draw
    #end
    draw_quad(
      left_x,  top_y, color,
      right_x, top_y, color,
      right_x, bottom_y, color,
      left_x,  bottom_y, color,
      z_order
    )
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
