# frozen_string_literal: true

require_relative '../codegen/html_generator'

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

    def format_directory(cache, node, level)
      cache << Codegen::HtmlGenerator.div do
        [
          Codegen::HtmlGenerator.header(node.name, level),
          node.children.map { |child_node| format([], child_node, level.next) }
        ].flatten.join("\n")
      end
    end

    def format_bookmark(cache, node)
      cache << Codegen::HtmlGenerator.paragraph do
        Codegen::HtmlGenerator.link(node.name, node.url)
      end
    end

    def format(page_cache, node, level = 1)
      page_cache.tap do |cache|
        if node.is_a?(Bkmrq::Bookmark)
          format_bookmark(cache, node)
        elsif node.is_a?(Bkmrq::BookmarkDir) && node.children?
          format_directory(cache, node, level)
        end
      end
    end
  end
end
