# frozen_string_literal: true

require_relative 'arg_parser'
require_relative '../application'

module Bkmrq
  module Cli
    # Cli Application Interface
    class App
      def self.run!
        Bkmrq::Application
          .new(opts: Bkmrq::Cli::ArgParser.parse!)
          .export!
      end
    end
  end
end
