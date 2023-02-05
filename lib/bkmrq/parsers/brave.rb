# frozen_string_literal: true

require 'oj'
require_relative '../bookmark'

module Parsers
  # Brave Bookmarks Parser
  class Brave
    attr_accessor :rawdata

    def initialize(rawdata)
      @rawdata = rawdata
    end

    def run
      Oj.load(rawdata)
    end
  end
end
