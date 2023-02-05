# frozen_string_literal: true

require 'optparse'
require_relative '../ui'

module Bkmrq
  module Cli
    module ArgParser
      def self.new
        lambda do |parsed = {}|
          parsed.tap do |options|
            parser = OptionParser.new do |opts|
              opts.banner = Bkmrq::Ui::BANNER
              opts.separator Bkmrq::Ui::USAGE
              opts.separator "\n\s\s\s\s# OPTIONS:\n"

              opts.on('--to=FILEPATH', 'save the export file to <FILEPATH>') do |filepath|
                options[:filepath] = filepath
              end

              opts.on('--browser=BROWSER', 'export bookmarks from <BROWSER>') do |browser|
                options[:browser] = browser
              end

              opts.on('--format=FILEFORMAT', 'export bookmarks to <FORMAT> File.') do |fileformat|
                options[:format] = fileformat
              end

              opts.on(
                '--exclude=XPATTERNS',
                'exclude bookmarks or folders containing <KEYWORDS>'
              ) { |xpatterns| options[:xpatterns] = xpatterns }

              opts.on('--help', 'Print help docs') do
                puts opts
                exit
              end
            end
            parser.parse!(ARGV)
          end
        end
      end
    end
  end
end
