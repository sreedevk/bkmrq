# frozen_string_literal: true

# Codegenerator module
module Codegen
  # Generator for markdown
  class MarkdownGenerator
    def self.image(url, alt_text)
      "![#{alt_text}](#{url})"
    end

    def self.title(text, level = 1, id = nil)
      (('#' * level) + " #{text}") + (id ? "{##{id}}" : '')
    end

    def self.strikethrough(text)
      "--#{text}--"
    end

    def self.highlight(text)
      "==#{text}=="
    end

    def self.tasklist(items, completed_indices = [])
      items
        .map
        .with_index { |item, index| "- [#{completed_indices.include?(index) ? 'x' : ''}] #{item}" }
        .join("\n")
    end

    def self.ordered_list(items)
      items
        .map.with_index { |item, index| "#{index.next}. #{item}" }
        .join("\n")
    end

    def self.bold(text)
      "**#{text}**"
    end

    def self.blockquote(text)
      "> #{text}"
    end

    def self.code(text)
      "`#{text}`"
    end

    def self.italic(text)
      "*#{text}*"
    end

    def self.horizontal_rule
      '---'
    end

    def self.link(text, url)
      "[#{text}](#{url})"
    end

    def self.unordered_list(items)
      items
        .map { |item| "- #{item}" }
        .join("\n")
    end

    def self.codeblock(text, source_lang = '')
      <<~CDB
        ```#{source_lang}
        #{text}
        ```
      CDB
    end
  end
end
