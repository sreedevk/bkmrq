#!/usr/bin/env ruby

# frozen_string_literal: true

require 'optparse'
require_relative 'bkmrq'

# Cli
class BkmrqCli
  BANNER = <<-MAN
  Bkmrq - Export your bookmarks to markdown

  # Supported Browsers
  - brave
  MAN

  def initialize(args)
    @opts = {}
    option_parser.parse!(args&.split(/\s+/), into: @opts)
  end

  def option_parser
    @option_parser ||= OptionParser.new do |opts|
      opts.on('-F', '--input-file', String, 'Json file generated by your browser.')
      opts.on('-O', '--output-file', String, 'output Markdowne file path')
      opts.on('-B', '--browser', String, 'load browser defaults')
      opts.on('-E', '--edit', 'load generated markdown in $EDITOR')
      opts.on('-H', '--help', 'Print this help message') { puts opts }
    end
  end
end
