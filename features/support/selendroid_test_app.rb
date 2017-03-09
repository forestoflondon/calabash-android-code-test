require 'calabash-android'

class SelendroidTestApp < Calabash::ABase

  def home_screen
    @home_screen ||= Home.new(self)
  end

  def web_view_screen
    @web_view_screen ||= WebView.new(self)
  end

  def screen(obj)
    @screen = obj.new(self)
  end

end
