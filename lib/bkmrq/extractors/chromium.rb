# frozen_string_literal: true

require_relative './error'

module Extractors
  # Chrome Bookmarks Extractor
  class Chromium
    def self.extract
      new.extract
    end

    def extract
      Oj.load(File.read(bookmarks_path))
    end

    def bookmarks_path
      case RbConfig::CONFIG['host_os']
      when /mswin|msys|mingw|cygwin|bccwin|wince/i
        File.expand_path('~/AppData/Local/Chromium/User Data/Default/Bookmarks')
      when /darwin|mac os/i
        File.expand_path('~/Library/Application Support/Chromium/Default/Bookmarks')
      when /linux/i, /solaris|bsd/i
        File.expand_path('~/.config/chromium/Default/Bookmarks')
      else
        raise Bkmrq::Extractors::Error, 'bkmrq is not supported on your OS.'
      end
    end
  end
end
