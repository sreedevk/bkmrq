# frozen_string_literal: true

# Main Application Namespace
module Bkmrq
  require 'bkmrq/cli/app'
  VERSION = '0.1.1'

  def self.init
    Bkmrq::Cli::App.run!
  end
end
