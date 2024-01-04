# frozen_string_literal: true

require_relative '../bookmark'
require_relative '../codegen/markdown_generator'

# Formatters
module Formatters
  require_relative './assets'

  # Markdown Formatter
  class Markdown
    def self.format(tree)
      new.format([], tree)
    end

    def format(page_cache, node, level = 1)
      page_cache.tap do |cache|
        if node.is_a?(Bkmrq::BookmarkDir) && node.children?
          cache.push(Codegen::MarkdownGenerator.title(node.name, level))
          node.children.each do |child_node|
            format(cache, child_node, level.next)
          end
        elsif node.is_a?(Bkmrq::Bookmark)
          cache.push(Codegen::MarkdownGenerator.link(node.name, node.url))
        else
          raise "Invalid IR Tree Node Detected: #{node.class}"
        end
      end
    end

    private

    def add_doc_title(page_cache)
      text = "#{ENV.fetch('USER', 'Bkmrq User').capitalize}'s Bookmarks"
      page_cache.push(Codegen::MarkdownGenerator.title(text))
    end

    def add_header_image(page_cache)
      page_cache.push(Codegen::MarkdownGenerator.image(Assets::Images::LIBRARY, library))
    end
  end
end
