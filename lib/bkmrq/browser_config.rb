# frozen_string_literal: true

# Bkmrq
module Bkmrq
  USER_HOME             = ENV.fetch('HOME', ::File.join('home', ENV['USER']))

  BRAVE_BROWSER_CONFIG  = {
    bookmark_file_path: File.join(
      USER_HOME, '.config', 'BraveSoftware', 'Brave-Browser', 'Default', 'Bookmarks'
    ),
    root: 'roots'
  }.freeze

  CHROME_BROWSER_CONFIG = {
    bookmark_file_path: File.join(USER_HOME, '.config', 'chromium', 'Default', 'Bookmarks'),
    root: 'roots'
  }.freeze

  BROWSER_CONFIG = {
    'brave' => BRAVE_BROWSER_CONFIG,
    'chrome' => CHROME_BROWSER_CONFIG,
    'chromium' => CHROME_BROWSER_CONFIG
  }.freeze
end
