#!/usr/bin/env ruby

# frozen_string_literal: true

require 'optparse'
require 'bkmrq/app'
require 'bkmrq/manual'

module Bkmrq
  # Cli
  class Cli
    def initialize(args)
      @opts = {}
      option_parser.parse!(default_args(sanitize_args(args)), into: @opts)
      init_app if opts_valid?
    end

    private

    def init_app
      Bkmrq::App.new(
        **@opts.slice(*Bkmrq::Manual.options_specs.map(&:last))
      ).export!
    end

    def option_parser
      @option_parser ||= OptionParser.new do |args|
        # Option Parsing
        Bkmrq::Manual.options_specs.map do |option_spec|
          option_key = option_spec.pop
          args.on(*option_spec) { |input| @opts[option_key] = input }
        end

        # Manual Printing
        args.banner = Bkmrq::Manual::BANNER
        args.on_tail('-H', '--help', 'Bkmrq Manual') { puts args }
      end
    end

    def sanitize_args(args)
      args.reject(&:empty?).map(&:scrub).map(&:split).flatten
    end

    def default_args(args)
      args.empty? ? ['-H'] : args
    end

    def opts_valid?
      !@opts.key?(:help)
    end
  end
end
