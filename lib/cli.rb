#!/usr/bin/env ruby

# frozen_string_literal: true

require 'optparse'
require 'pry'

require_relative 'bkmrq'
require_relative 'manual'

module Bkmrq
  # Cli
  class Cli
    def initialize(args)
      @opts = {}
      option_parser.parse!(sanitize_args(args), into: @opts)
    end

    private

    def option_parser
      @option_parser ||= OptionParser.new do |args|
        # Option Parsing
        Bkmrq::Manual.options_specs.map do |option_spec|
          option_key = option_spec.pop
          args.on(*option_spec) { |input| @opts.send(:[]=, option_key, input) }
        end

        # Manual Printing
        args.banner = Bkmrq::Manual::BANNER
        args.on_tail('-H', '--help', 'Bkmrq Manual') { puts args }
      end
    end

    def sanitize_args(args)
      args.reject(&:empty?).map(&:scrub).map(&:split).flatten
    end
  end
end
