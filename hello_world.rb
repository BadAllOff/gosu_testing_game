require 'gosu'

class HelloWorldGame < Gosu::Window
  def initialize width=800, height=600, fullscreen=false
    super
    self.caption = 'Hello World'

    @image = Gosu::Image.from_text self,
                  "Hello People!!!",
                  Gosu.default_font_name,
                  100
  end

  def button_down id
    close if id == Gosu::KbEscap
  end

  def update

  end

  def draw
    @image.draw self.width/2 - @image.width/2,
                self.height/2 - @image.height/2,
                0,1,1,0xdd22aaff 

  end

end

HelloWorldGame.new.show
