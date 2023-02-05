# frozen_string_literal: true

require_relative './error'

module Extractors
  # Chrome Bookmarks Extractor
  class Safari
    def self.extract
      new.extract
    end

    def extract
      Oj.load(File.read(bookmarks_path))
    end

    def bookmarks_path
      unless /darwin|mac os/i =~ RbConfig::CONFIG['host_os']
        raise Bkmrq::Extractors::Error, 'bkmrq does not support Safari on your OS'
      end

      File.expand_path('~/Library/Safari/Bookmarks.plist')
    end
  end
end
