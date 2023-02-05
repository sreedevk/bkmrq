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
        .then { |parsed_bookmarks| parsed_bookmarks['roots'] }
        .then { |bookmark_tree| generate_bookmarks(bookmark_tree) }
    end

    private

    def generate_bookmarks(tree)
      tree.inject({}) do |mem, (mark_type, bookmarks)|
        mem.tap do |cache|
          cache[mark_type] = traverse(bookmarks)
        end
      end
    end

    def traverse(tree, cache = {})
      case tree['type']
      when 'folder'
        cache.tap do |inst_cache|
          inst_cache[tree['name']] = {}
          tree['children'].each do |child|
            traverse(child, inst_cache[tree['name']])
          end
        end
      when 'url'
        cache.tap do |inst_cache|
          inst_cache[tree['name']] = Bkmrq::Bookmark.new(
            url: tree['url'],
            name: tree['name'],
            created_at: Time.at(Integer(tree['date_added'])),
            id: tree['id'],
            guid: tree['guid']
          )
        end
      end
    end
  end
end
