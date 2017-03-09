class WebView < Calabash::ABase

  def enter_name(name)
    name_text_box = "webview css:'#name_input'"
    tap_when_element_exists(name_text_box)
    clear_text_in(name_text_box)
    keyboard_enter_text(name)
  end

  def select_car_manufacturer(manufacturer)
    tap_when_element_exists("webView css:'*' nodeName:'SELECT'")
    tap_when_element_exists("* id:'text1' text:'#{manufacturer}'")
    self
  end

  def tap_send_me_your_name
    tap_when_element_exists("webView css:'*' nodeName:'INPUT' id:''")
  end

  def get_hello_message
      wait_for_element_exists("webView css:'*' nodeName:'H1' textContent:'This is my way of saying hello'")
      query("webView css:'*' nodeName:'BODY'",:textContent)
  end

end
