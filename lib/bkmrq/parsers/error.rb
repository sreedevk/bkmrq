# frozen_string_literal: true

require_relative '../error'

module Parsers
  # Extranctor Errors
  class Error < Bkmrq::Error
    def initialize(message)
      @input = message
      super("[BKMRQ ERR] #{input}")
    end
  end
end
