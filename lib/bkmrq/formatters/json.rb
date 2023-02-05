# frozen_string_literal: true

module Formatters
  # Markdown Formatter
  class Json
    attr_accessor :root

    def initialize(tree)
      @root = tree
    end
  end
end
