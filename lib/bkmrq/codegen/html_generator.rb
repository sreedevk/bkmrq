# frozen_string_literal: true

module Codegen
  class HtmlGenerator
    def self.link(text, url)
      "<a href=\"#{url}\" target=\"_blank\" rel=\"noopener noreferrer\">#{text}</a>"
    end

    def self.header(text, level)
      level = 6 if level > 6
      "<h#{level}>#{text}</h#{level}>"
    end

    def self.div
      <<-HTML
      <div>#{yield}</div>
      HTML
    end

    def self.paragraph
      <<-HTML
      <p>#{yield}</p>
      HTML
    end
  end
end
