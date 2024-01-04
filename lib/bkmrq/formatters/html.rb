# frozen_string_literal: true

module Formatters
  # Html Formatter
  class Html
    def self.format(tree)
      new.format!(tree)
    end

    def format!(tree)
      format([], tree)
    end

    private

    def format(page_cache, node)
      page_cache.tap do |cache|
        if node.is_a?(Bkmrq::Bookmark)
          cache << { name: node.name, url: node.url, type: :bookmark }
        elsif node.is_a?(Bkmrq::BookmarkDir) && node.children?
          cache << { name: node.name, children: node.children.map { |child_node| format([], child_node) }, type: :dir }
        end
      end
    end
  end
end
