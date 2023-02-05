# frozen_string_literal: true

# Main Module
module Bkmrq
  require_relative './brave'
  require_relative './chrome'
  require_relative './chromium'
  require_relative './firefox'
  require_relative './opera'
  require_relative './safari'
  require_relative './error'

  # Parse Raw Browser Bookmarks
  module Parsers
    def self.run(rawdata, opts)
      Object
        .const_get("Parsers::#{opts[:browser].capitalize}")
        .new(rawdata)
        .run
    end
  end
end
