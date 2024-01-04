# frozen_string_literal: true

require_relative '../bookmark'
require_relative '../codegen/markdown_generator'

# Formatters
module Formatters
  require_relative './assets'

  # Markdown Formatter
  class Markdown
    def self.format(tree)
      new.format([], tree.values)
    end

    def format(page_cache, tree, level = 1)
      page_cache.tap do |cache|
        tree.each do |node|
          if bookmark?(node)
            cache.push(Codegen::MarkdownGenerator.link(node['name'], node['url']))
          elsif folder?(node)
            cache.push(Codegen::MarkdownGenerator.title(node['name'], level))
            if node['children'].any?
              format(cache, node['children'], level.next)
            end
          end
        end
      end
    end

    private

    def bookmark?(node)
      node['type'].eql?('url')
    end

    def folder?(node)
      node['type'].eql?('folder')
    end

    def add_doc_title(page_cache)
      text = "#{ENV.fetch('USER', 'Bkmrq User').capitalize}'s Bookmarks"
      page_cache.push(Codegen::MarkdownGenerator.title(text))
    end

    def add_header_image(page_cache)
      page_cache.push(Codegen::MarkdownGenerator.image(Assets::Images::LIBRARY, library))
    end
  end
end
