# frozen_string_literal: true

module Bkmrq
  # Common Bookmark Format for All Browsers
  class Bookmark
    attr_accessor :guid, :url, :name, :created_at, :id

    def initialize(url:, name:, created_at:, id:, guid: nil)
      @guid = guid
      @name = name
      @url = url
      @created_at = created_at
      @id = id
    end
  end
end
