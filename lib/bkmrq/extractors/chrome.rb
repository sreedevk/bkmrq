# frozen_string_literal: true

require_relative 'error'

module Extractors
  # Chrome Bookmarks Extractor
  class Chrome
    def self.extract
      new.extract
    end

    def extract
      File.read(bookmarks_path)
    end

    def bookmarks_path
      case RbConfig::CONFIG['host_os']
      when /mswin|msys|mingw|cygwin|bccwin|wince/i
        File.expand_path('~/AppData/Local/Google/Chrome/User Data/Default/Bookmarks')
      when /darwin|mac os/i
        File.expand_path('~/Library/Application Support/Google/Chrome/Default/Bookmarks')
      when /linux/i, /solaris|bsd/i
        File.expand_path('~/.config/google-chrome/Default/Bookmarks')
      else
        raise Bkmrq::Extractors::Error, 'bkmrq is not supported on your OS.'
      end
    end
  end
end
