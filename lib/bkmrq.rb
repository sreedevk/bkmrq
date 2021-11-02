# frozen_string_literal: true

require 'json'
require_relative "#{File.dirname(__FILE__)}/docs_template"

# Bookmarks Document Generator
class Bkmrq
  USER_HOME              = ENV.fetch('HOME', ::File.join('home', ENV['USER']))
  BLOCKLIST              = ENV.fetch('BKMRQ_BLOCKLIST', '(pdf|google|file:)').split(',').map(&:strip)

  OUTPUT_FILE_NAME       = ENV.fetch('BKMRQ_OUTPUT_FILE_NAME', 'bkmrq_export_{timestamp}.md')
  BROWSER_BOOKMARKS_FILE = ENV.fetch(
    'BROWSER_BOOKMARKS_DIR',
    ::File.join(
      USER_HOME,
      '.config',
      'BraveSoftware',
      'Brave-Browser',
      'Default',
      'Bookmarks'
    )
  )

  def initialize
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
      OUTPUT_FILE_NAME.sub('{timestamp}', String(Integer(Time.now))[0..-2]),
      'w+'
    )
  end

  def bookmarks
    @bookmarks ||= ::File.open(BROWSER_BOOKMARKS_FILE, 'r') do |file|
      JSON.parse(file.read)['roots']
    end
  end

  def write_template
    [:title, :subtitle, :header_image, :description]
      .map(&DocsTemplate.method(:public_send))
      .map(&output_file.method(:write))
  end

  def export(marqs = bookmarks, level = 1)
    return if skip_export?(marqs)

    output_file.write(generate_formatted_entity(marqs, level))

    marqs.fetch('children', []).empty? ||
      marqs['children'].map { |child| export(child, level + 1) }
  end

  def skip_export?(bookmark_section)
    [bookmarks['name'], bookmarks['name']].any? do |meta|
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
