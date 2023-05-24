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

    def format(page_cache, tree, level = 1)
      if tree.is_a?(Bkmrq::Bookmark)
        page_cache.push(Codegen::MarkdownGenerator.link(tree.name, tree.url))
      else
        tree.map do |name, subtree|
          page_cache.push(Codegen::MarkdownGenerator.title(name, level))
          format(page_cache, subtree, level.next)
        end
      end
    end

    private

    def add_doc_title(page_cache)
      text = "#{ENV.fetch('USER', 'Bkmrq User')}'s Bookmarks"
      page_cache.push(Codegen::MarkdownGenerator.title(text))
    end

    def add_header_image(page_cache)
      page_cache.push(Codegen::MarkdownGenerator.image(Assets::Images::LIBRARY, library))
    end
  end
end
