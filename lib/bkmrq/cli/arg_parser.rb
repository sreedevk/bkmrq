# frozen_string_literal: true

require 'optparse'
require_relative '../../bkmrq'
require_relative '../ui'

module Bkmrq
  module Cli
    # Argument Parser
    module ArgParser
      def self.filepath_opt(parser, options)
        parser.on(
          '--to=FILEPATH',
          '-oFILEPATH',
          'save the export file to <FILEPATH>'
        ) { |filepath| options[:filepath] = filepath }
      end

      def self.browser_opt(parser, options)
        parser.on(
          '--browser=BROWSER',
          '-bBROWSER',
          'export bookmarks from <BROWSER>'
        ) { |browser| options[:browser] = browser }
      end

      def self.format_opt(parser, options)
        parser.on(
          '--format=FILEFORMAT',
          '-fFILEFORMAT',
          'export bookmarks to <FORMAT> File.'
        ) { |fileformat| options[:format] = fileformat }
      end

      def self.exclude_patterns_opt(parser, options)
        parser.on(
          '--exclude=XPATTERNS',
          '-xXPATTERNS',
          'exclude bookmarks or folders containing <KEYWORDS>'
        ) { |xpatterns| options[:xpatterns] = xpatterns }
      end

      def self.banner(parser)
        parser.banner = Bkmrq::Ui::BANNER
        parser.separator Bkmrq::Ui::USAGE
        parser.separator "\n\s\s\s\s# OPTIONS:\n"
      end

      def self.version(parser)
        parser.on('--version', '-v', 'Print Version') do
          puts "bkmrq v#{Bkmrq::VERSION}"
          exit
        end
      end

      def self.help(parser)
        parser.on('--help', '-h', 'Print help docs') do
          puts parser
          exit
        end
      end

      def self.generate_opt_parser(options)
        OptionParser.new do |parser|
          banner(parser)
          filepath_opt(parser, options)
          browser_opt(parser, options)
          format_opt(parser, options)
          exclude_patterns_opt(parser, options)
          version(parser)
          help(parser)
        end
      end

      def self.new
        lambda do |parsed_set = {}|
          parsed_set
            .tap { |options| generate_opt_parser(options).parse!(ARGV) }
        end
      end
    end
  end
end
