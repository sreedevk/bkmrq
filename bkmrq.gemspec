# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name = 'bkmrq'
  s.version = '0.1.1'
  s.licenses = ['MIT']
  s.summary = 'Cross browser multi-format bookmarks exporter'
  s.description = <<~DESC
    The Bookmark Exporter CLI is a command-line tool for organizing and transferring
    bookmarks across multiple browsers including Chrome, Firefox, Safari, and Opera.
    With just a few simple commands, export bookmarks in JSON, Markdown, CSV, and HTML formats.
    Ideal for automated scripts and command line users, it's fast and efficient.
  DESC
  s.authors = ['sreedev <sreedevpadmakumar@gmail.com>']
  s.email = 'sreedevpadmakumar@gmail.com'
  s.homepage = 'https://rubygems.org/gems/bkmrq'
  s.metadata = { 'source_code_uri' => 'https://github.com/sreedevk/bkmrq' }
  s.executables = ['bkmrq']
  s.require_paths = ['lib']
  s.files = [
    Dir['lib/**/*'].keep_if { |file| File.file?(file) },
    %w[Gemfile Gemfile.lock LICENSE README.md bkmrq.gemspec]
  ].flatten

  # Dependencies
  s.add_dependency 'oj', '~> 3.14.1'
  s.add_dependency 'progress_bar', '~> 1.3.3'
  s.add_development_dependency 'rspec', '~> 3.12.0'
  s.add_development_dependency 'rubocop', '~> 1.43.0'
  s.add_development_dependency 'rubocop-performance', '~> 1.15.2'
  s.add_development_dependency 'rubocop-rspec', '~> 2.18.1'
end
