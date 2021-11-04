#!/usr/bin/env ruby

# frozen_string_literal: true

require 'optparse'
require_relative 'bkmrq'

module Bkmrq
  # Cli
  class Cli
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
        opts.on('-F', '--input-file', String, 'Bookmarks file generated by your browser. (JSON FORMAT ONLY)')
        opts.on('-O', '--output-file', String, 'Filepath for markdown generated by Bkmrq')
        opts.on('-B', '--browser', String, 'Browser (Loads Default Configs)')
        opts.on('-E', '--edit', 'Load Generated Markdown in $EDITOR (will not persist generated output)')
        opts.on('-H', '--help', 'Print Bkmrq Manual') { puts opts }
      end
    end
  end
end
