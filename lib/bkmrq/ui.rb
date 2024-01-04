# frozen_string_literal: true

module Bkmrq
  module Ui
    BANNER = <<-BNR
        ___  __
       / _ )/ /__ __ _  _______ _
      / _  /  '_//  ' \\/ __/ _ `/
     /____/_/\\_\\/_/_/_/_/  \\_, /
                            /_/
    BNR

    USAGE = <<-USG
    # Examples
    --------------------------------
    # Export Bookmarks from Brave Browser in Markdown format
    $ bkmrq export --to=brave_bookmarks.md --browser=brave --format=markdown

    # Export Bookmarks from Chromium Browser
    # in Markdown format & exclude bookmarks/folders with the word "php" and "java"
    $ bkmrq export --to=chromium_books.md --browser=chromium --format=markdown --exclude="php,java"
    --------------------------------

    # Supported Browsers(--browser=)
    - brave
    - chromium
    - chrome
    - firefox
    - opera
    - safari (mac only)

    # Supported Export Formats (--format=)
    - markdown
    - json
    - html
    - csv
    USG
  end
end
