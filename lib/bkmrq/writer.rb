# frozen_string_literal: true

module Bkmrq
  # Writes output to file
  class Writer
    def self.run(formatted_bookmarks, opts)
      File.open(opts[:filepath], 'w+') do |file|
        file.puts(formatted_bookmarks)
      end
    end
  end
end
