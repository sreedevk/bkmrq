# frozen_string_literal: true

require_relative '../bookmark'
require_relative '../codegen/markdown_generator'

# Formatters
module Formatters
  require_relative 'assets'

  # Markdown Formatter
  class Markdown
    def self.format(tree)
      new.format!(tree)
    end

    def format!(tree)
      format((method(:add_doc_title) >> method(:add_header_image)).call([]), tree)
    end

    private

    def format_dir(cache, node, level)
      cache.push(Codegen::MarkdownGenerator.title(node.name, level))
      node.children.each do |child_node|
        format(cache, child_node, level.next)
      end
    end

    def format(page_cache, node, level = 1)
      page_cache.tap do |cache|
        if node.is_a?(Bkmrq::BookmarkDir) && node.children?
          format_dir(cache, node, level)
        elsif node.is_a?(Bkmrq::Bookmark)
          cache.push(Codegen::MarkdownGenerator.line(Codegen::MarkdownGenerator.link(node.name, node.url)))
        else
          raise Bkmrq::Extractors::Error, "Invalid IR Tree Node Detected: #{node.class}"
        end
      end
    end

    def add_doc_title(page_cache)
      text = "#{ENV.fetch('USER', 'Bkmrq User').capitalize}'s Bookmarks"
      page_cache.push(Codegen::MarkdownGenerator.title(text))
    end

    def add_header_image(page_cache)
      page_cache.push(Codegen::MarkdownGenerator.image(Assets::Images::LIBRARY, 'library'))
    end
  end
end
