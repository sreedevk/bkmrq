# frozen_string_literal: true

# Application root module
module Bkmrq
  require_relative 'csv'
  require_relative 'html'
  require_relative 'json'
  require_relative 'markdown'

  # Formats to markdown/html/toml/json
  class Formatters
    def self.run(filtered_bookmarks, opts)
      Object
        .const_get("Formatters::#{opts[:format].capitalize}")
        .format(filtered_bookmarks)
    end
  end
end
