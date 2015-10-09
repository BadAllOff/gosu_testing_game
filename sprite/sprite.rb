require 'gosu'
class Sprite
  def initialize window
    @window = window
    @width  = 128
    @height = 128
    @idle = Gosu::Image.load_tiles  @window,
                                    "sprite3.png",
                                    @width,
                                    @height,
                                    true

    @move = Gosu::Image.load_tiles  @window,
                                    "sprite4.png",
                                    @width,
                                    @height,
                                    true
    # center Image
    @x = @window.width/2 - @width/2
    @y = @window.height/2 - @height/2
    @direction = :right
    @frame = 0
    @moving = false
  end

  def update
    @frame += 1
    @moving = false
    if @window.button_down? Gosu::KbLeft
      @direction = :left
      @moving = true
      @x += -5
    end
    if @window.button_down? Gosu::KbRight
      @direction = :right
      @moving = true
      @x += 5
    end
  end

  def draw
    f = @frame % @idle.size
    image = @moving ? @move[f] : @idle[f]
    if @direction == :right
      image.draw @x, @y, 1
    else
      image.draw @x + @width, @y, 1, -1, 1
    end
  end

end

class SpriteGame < Gosu::Window
  def initialize width = 800, height = 600, fullscreen=false
    super
    self.caption = "Sprite Demonstartion"
    @sprite = Sprite.new self
  end

  def button_down id
    close if id == Gosu::KbEscape
  end

  def update
    @sprite.update
  end

  def draw
    @sprite.draw
  end

end

SpriteGame.new.show
