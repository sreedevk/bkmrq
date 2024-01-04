# frozen_string_literal: true

# Application Container
module Bkmrq
  require_relative 'extractors/extractors'
  require_relative 'parsers/parsers'
  require_relative 'filter'
  require_relative 'formatters/formatters'
  require_relative 'writer'

  # Application Core
  class Application
    attr_accessor :opts

    def initialize(opts: {})
      @opts = opts
    end

    def export!
      Bkmrq::Extractors.run(opts)
                       .then { |extracted_file| Bkmrq::Parsers.run(extracted_file, opts) }
                       .then { |parsed_file| Bkmrq::Filter.run(parsed_file, opts) }
                       .then { |filtered_bookmarks| Bkmrq::Formatters.run(filtered_bookmarks, opts) }
                       .then { |formatted_bookmarks| Bkmrq::Writer.run(formatted_bookmarks, opts) }
    end
  end
end
