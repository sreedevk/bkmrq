# frozen_string_literal: true

# Main Application Namespace
module Bkmrq
  require 'bkmrq/cli/app'

  def self.init
    Bkmrq::Cli::App.run!
  end
end
