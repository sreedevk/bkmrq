#!/usr/bin/env ruby

# frozen_string_literal: true

require 'optparse'

require_relative 'bkmrq'
require_relative 'manual'

module Bkmrq
  # Cli
  class Cli
    def initialize(args)
      @opts = {}
      option_parser.parse!(sanitize_args(args), into: @opts)
    end

    def option_parser
      @option_parser ||= OptionParser.new do |opts|
        Bkmrq::Manual::OPTS.map { |option_spec| opts.on(*option_spec) }
      end
    end

    private

    def sanitize_args(args)
      args.reject(&:empty?).map(&:scrub).map(&:split).flatten
    end
  end
end
