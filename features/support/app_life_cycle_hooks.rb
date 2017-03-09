require 'calabash-android/management/adb'
require 'calabash-android/operations'

Before do |scenario|
  `#{adb_command} logcat -c`
  start_test_server_in_background
end

After do |scenario|
  if scenario.failed?
    screenshot_embed
  end
  shutdown_test_server
  `#{adb_command} logcat -c`
end
