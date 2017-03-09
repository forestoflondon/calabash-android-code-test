require 'calabash-android/calabash_steps'
require 'rspec'

Given(/^I am on the Web View Screen$/) do
  @app.home_screen.wait_to_load
      .tap_start_web_view_button
end

When(/^I enter my name as "([^"]*)"$/) do |name|
  @name = name
  @app.web_view_screen.enter_name(@name)
end

And(/^select my preferred car as an "([^"]*)"$/) do |manufacturer|
  @manufacturer = manufacturer
  @app.web_view_screen.select_car_manufacturer(@manufacturer)
      .tap_send_me_your_name
end

Then(/^my inputs are displayed correctly in the hello message$/) do
  @hello_message = @app.web_view_screen.get_hello_message
  expect(@hello_message.to_s.downcase).to include @name.downcase
  expect(@hello_message.to_s.downcase).to include @manufacturer.downcase
end

Given(/^I am on the Home Screen$/) do
  @app.home_screen.wait_to_load
end

When(/^I open the pop\-up window$/) do
  @app.home_screen.tap_on_display_popup_button
end

When(/^I force an App crash$/) do
  @crash = @app.home_screen.tap_on_throw_exception_button
end

Then(/^the App has crashed$/) do
  expect(@crash).to be_truthy
end

And(/^the crash appears in the log$/) do
  expect(@app.home_screen.does_log_contain?("--------- beginning of crash")).to be_truthy
  expect(@app.home_screen.does_log_contain?("FATAL EXCEPTION")).to be_truthy
  expect(@app.home_screen.does_log_contain?("Process: io.selendroid.testapp")).to be_truthy
end
