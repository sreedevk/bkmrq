# frozen_string_literal: true

require_relative 'error'

module Extractors
  # Chrome Bookmarks Extractor
  class Firefox
    def self.extract
      new.extract
    end

    def extract
      Oj.load(File.read(bookmarks_path))
    end

    def bookmarks_path
      case RbConfig::CONFIG['host_os']
      when /mswin|msys|mingw|cygwin|bccwin|wince/i
        File.expand_path('~/AppData/Roaming/Mozilla/Firefox/Profiles/{PROFILE_FOLDER}/bookmarks.html')
      when /darwin|mac os/i
        File.expand_path('~/Library/Application Support/Firefox/Profiles/{PROFILE_FOLDER}/bookmarks.html')
      when /linux/i, /solaris|bsd/i
        File.expand_path('~/.mozilla/firefox/{PROFILE_FOLDER}/bookmarks.html')
      else
        raise Bkmrq::Extractors::Error, 'bkmrq is not supported on your OS.'
      end
    end
  end
end
