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
      Oj.load(rawdata).fetch("roots", {}).then { |roots| parse(Bkmrq::BookmarkDir.new('*'), roots.values) }
    end

    private

    def bookmark?(node)
      node['type'].eql?('url')
    end

    def folder?(node)
      node['type'].eql?('folder')
    end

    def parse(base_dir, tree)
      base_dir.tap do |dir|
        tree.map do |node|
          if bookmark?(node)
            dir.add_child(Bkmrq::Bookmark.new(node.slice('guid', 'name', 'url', 'date_added', 'id').transform_keys(&:to_sym)))
          elsif folder?(node) && node['children'].any? 
            Bkmrq::BookmarkDir.new(node['name']).tap do |new_base_dir|
              dir.add_child(new_base_dir)
              parse(new_base_dir, node['children'])
            end
          end
        end
      end
    end
  end
end
