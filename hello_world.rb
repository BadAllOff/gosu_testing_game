require 'gosu'

class HelloWorldGame < Gosu::Window
  def initialize width=800, height=600, fullscreen=false
    super
    self.caption = 'Hello World'
    @song   = Gosu::Song.new self, "sounds/song/Beauty.wav"
    @song.play
    @sample = Gosu::Sample.new self, "sounds/sample/sound4.wav"
    @image  = Gosu::Image.from_text self,
                  "Hello People!!!",
                  Gosu.default_font_name,
                  100
  end

  def button_down id
    close if id == Gosu::KbEscape
    @sample.play if id == Gosu::KbX
  end

  def update
    @x = self.width/2 - @image.width/2 + Math.sin(Time.now.to_f)*150
    @y = self.height/2 - @image.height/2 + Math.tan(Time.now.to_f)*100
  end

  def draw
    @image.draw @x, @y, 0, 1, 1, 0xdd22aaff

  end

end

HelloWorldGame.new.show
