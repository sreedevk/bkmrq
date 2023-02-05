# frozen_string_literal: true

module Bkmrq
  # Filters out bookmarks that matched the -x regex
  class Filter
    def self.run(parsed_file, _browser)
      parsed_file
    end
  end
end
