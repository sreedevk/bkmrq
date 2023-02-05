# frozen_string_literal: true

require 'optparse'
require_relative '../../bkmrq'
require_relative '../ui'

module Bkmrq
  module Cli
    # Argument Parser
    module ArgParser
      def self.assign_or_raise_arg(options, key, value)
        raise OptionParser::MissingArgument if value.blank?

        options[key] = value
      end

      def self.filepath_opt(parser)
        parser.on(
          '-o',
          '--to [FILEPATH]',
          'save the export file to <FILEPATH>'
        )
      end

      def self.browser_opt(parser)
        parser.on(
          '-b',
          '--browser [BROWSER]',
          %i[chrome chromium brave firefox safari opera],
          'export bookmarks from <BROWSER>'
        )
      end

      def self.format_opt(parser)
        parser.on(
          '-f',
          '--format [FILEFORMAT]',
          %i[markdown json csv html],
          'export bookmarks to <FORMAT> File.'
        )
      end

      def self.exclude_patterns_opt(parser)
        parser.on(
          '-x',
          '--exclude [XPATTERNS]',
          'exclude bookmarks or folders containing <KEYWORDS>'
        )
      end

      def self.banner(parser)
        parser.banner = Bkmrq::Ui::BANNER
        parser.separator Bkmrq::Ui::USAGE
        parser.separator "\n\s\s\s\s# OPTIONS:\n"
      end

      def self.version(parser)
        parser.on('-v', '--version', 'print bkmrq version') do
          puts "bkmrq v#{Bkmrq::VERSION}"
          exit
        end
      end

      def self.help(parser)
        parser.on('-h', '--help', 'print bkmrq help docs') do
          puts parser
          exit
        end
      end

      def self.generate_opt_parser
        OptionParser.new do |parser|
          banner(parser)
          filepath_opt(parser)
          browser_opt(parser)
          format_opt(parser)
          exclude_patterns_opt(parser)
          version(parser)
          help(parser)
        end
      end

      def self.parse!(parsed = {})
        parsed.tap do |options|
          generate_opt_parser.parse!(ARGV, into: options)
        end
      end
    end
  end
end
