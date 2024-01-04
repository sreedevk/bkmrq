# frozen_string_literal: true

module Bkmrq
  # TODO: Filters out bookmarks that matched the -x regex
  class Filter
    def self.run(parsed_file, opts)
      return parsed_file if opts[:exclude].nil?

      new.filter(parsed_file, opts[:exclude])
    end

    def filter(parsed_file, patterns)
    end
  end
end
