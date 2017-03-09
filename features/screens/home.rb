class Home < Calabash::ABase

  def wait_to_load
    wait_for_text("Hello Default Locale, Selendroid-test-app!")
    self
  end

  def tap_start_web_view_button
    tap_when_element_exists("ImageButton id:'buttonStartWebview'")
  end

  def tap_on_display_popup_button
    tap_when_element_exists("button id:'showPopupWindowButton'")
  end

  def tap_on_throw_exception_button
    begin
      tap_when_element_exists("button id:'exceptionTestButton'")
      return @crash = false
    rescue HTTPClient::KeepAliveDisconnected
      return @crash = true
    end
  end

  def does_log_contain?(text)
    log = `#{adb_command} logcat -t 1000`
    log.include?(text)
  end

end
