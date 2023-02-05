# frozen_string_literal: true

require 'set'

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

  # Bookmark Directory
  class BookmarkDir
    attr_accessor :children, :name

    def initialize(name)
      @name = name
      @children = Set[]
    end

    def add_child(child)
      @children << child
    end
  end
end
