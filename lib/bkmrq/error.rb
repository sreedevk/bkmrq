# frozen_string_literal: true

module Bkmrq
  # Bookmark Error
  class Error < StandardError
    attr_accessor :input
  end
end
