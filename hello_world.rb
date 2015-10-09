require 'gosu'

class HelloWorldGame < Gosu::Window
  def initialize width=800, height=600, fullscreen=false
    super
    self.caption = 'Hello World'
  end

  def button_down id
    close if id == Gosu::KbEscap
  end

  def update

  end

  def draw

  end

end

HelloWorldGame.new.show
