# frozen_string_literal: true

# Extractors
module Bkmrq
  require_relative 'error'
  require_relative 'brave'
  require_relative 'chrome'
  require_relative 'chromium'
  require_relative 'firefox'
  require_relative 'opera'
  require_relative 'safari'

  # Extracts Bookmarks Cross Platform
  module Extractors
    def self.run(opts)
      Object
        .const_get("Extractors::#{opts[:browser].capitalize}")
        .extract
    end
  end
end
