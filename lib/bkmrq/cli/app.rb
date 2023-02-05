# frozen_string_literal: true

require_relative 'arg_parser'
require_relative '../application'

module Bkmrq
  module Cli
    # Cli Application Interface
    class App
      def self.run!
        Bkmrq::Cli::ArgParser
          .new
          .call
          .then { |app_opts| Bkmrq::Application.new(opts: app_opts) }
          .then(&:export!)
      end
    end
  end
end
