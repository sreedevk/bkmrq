# frozen_string_literal: true

require 'json'
require 'fileutils'
require 'bkmrq/docs_template'
require 'bkmrq/browser_config'

module Bkmrq
  # Bookmarks Document Generator
  class App
    BLOCKLIST = ENV.fetch('BKMRQ_BLOCKLIST', '(pdf|google|file:)').split(',').map(&:strip)

    def initialize(browser: :brave, input_file: nil, output_path: nil, edit: false)
      @bookmarks_input = input_file  || Bkmrq::BROWSER_CONFIG.dig(browser, :bookmark_file_path)
      @output_path     = output_path || FileUtils.pwd
    end

    def export!
      write_template
      export(bookmarks['bookmark_bar'])
      export(bookmarks['other'])
      export(bookmarks['synced'])
      output_file.close
    end

    private

    def output_file
      @output_file ||= ::File.open(
        File.join(@output_path, "bkmrq_export_#{String(Integer(Time.now))[0..-2]}.md"),
        'w+'
      )
    end

    def bookmarks
      @bookmarks ||= ::File.open(@bookmarks_input, 'r') do |file|
        JSON.parse(file.read)['roots']
      end
    end

    def write_template
      %i[title subtitle header_image description]
        .map(&Bkmrq::DocsTemplate.method(:public_send))
        .map(&output_file.method(:write))
    end

    def export(marqs = bookmarks, level = 1)
      return if skip_export?(marqs)

      output_file.write(generate_formatted_entity(marqs, level))
      marqs.fetch('children', []).empty? ||
        marqs['children'].map { |child| export(child, level + 1) }
    end

    def skip_export?(bookmark_section)
      [bookmark_section['name'], bookmark_section['name']].any? do |meta|
        BLOCKLIST.any? { |pattern| !meta&.match(pattern).nil? }
      end
    end

    def generate_formatted_entity(bookmark, level)
      if bookmark['url'].nil?
        generate_bookmark_title(bookmark, level)
      else
        generate_bookmark_link(bookmark, level)
      end
    end

    def generate_bookmark_title(bookmark, level)
      [
        ' ' * level,
        '#' * level,
        "#{bookmark['name']}\n"
      ].join(' ')
    end

    def generate_bookmark_link(bookmark, level)
      [
        ' ' * level,
        "[#{bookmark['name']}](#{bookmark['url']})  \n"
      ].join(' ')
    end
  end
end
