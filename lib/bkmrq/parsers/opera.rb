# frozen_string_literal: true

require 'oj'

module Parsers
  # Brave Bookmarks Parser
  class Opera
    attr_accessor :rawdata

    def initialize(rawdata)
      @rawdata = rawdata
    end

    def run
      Oj.load(rawdata)
        .then { |parsed_bookmarks| parsed_bookmarks['roots'] }
    end
  end
end
