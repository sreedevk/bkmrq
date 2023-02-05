# frozen_string_literal: true

module Bkmrq
  # Common Bookmark Format for All Browsers
  class Bookmark
    attr_accessor :guid, :url, :name, :created_at, :id, :path

    def initialize(opts)
      @guid = opts[:guid]
      @name = opts[:name]
      @path = opts[:path]
      @url = opts[:url]
      @created_at = opts[:created_at]
      @id = opts[:id]
    end
  end
end
