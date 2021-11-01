# frozen_string_literal: true

PACKAGE_NAME           = 'bkmrq'
VERSION                = '0.0.1'
TRAVELING_RUBY_VERSION = {
  'linux-x86_64' => '20210206-2.4.10',
  'linux-x86' => '20150715-2.2.2',
  'osx' => '20150715-2.2.2'
}.freeze

# traveling-ruby-20210206-2.4.10-linux-x86_64.tar.gz
# traveling-ruby-20210206-2.4.10-osx.tar.gz
# traveling-ruby-20210206-2.4.10-x86_64-win32.tar.gz
# traveling-ruby--linux-x86.tar.gz

desc 'Compile & Pack'
task package: ['package:linux:x86', 'package:linux:x86_64', 'package:osx']

namespace :package do
  namespace :linux do
    desc 'Package for Linux x86'
    task x86: "packaging/traveling-ruby-#{TRAVELING_RUBY_VERSION[:x86]}-linux-x86.tar.gz" do
      create_package('linux-x86')
    end

    desc 'Package for Linux x86_64'
    task 'x86_64': "packaging/traveling-ruby-#{TRAVELING_RUBY_VERSION[:x86_64]}-linux-x86_64.tar.gz" do
      create_package('linux-x86_64')
    end
  end

  desc 'Package for OS X'
  task osx: "packaging/traveling-ruby-#{TRAVELING_RUBY_VERSION[:osx]}-osx.tar.gz" do
    create_package('osx')
  end
end

file "packaging/traveling-ruby-#{TRAVELING_RUBY_VERSION[:x86]}-linux-x86.tar.gz" do
  download_runtime('linux-x86')
end

file "packaging/traveling-ruby-#{TRAVELING_RUBY_VERSION[:x86_64]}-linux-x86_64.tar.gz" do
  download_runtime('linux-x86_64')
end

file "packaging/traveling-ruby-#{TRAVELING_RUBY_VERSION[:osx]}-osx.tar.gz" do
  download_runtime('osx')
end

def create_package(target)
  package_dir = "#{PACKAGE_NAME}-#{VERSION}-#{target}"
  sh "rm -rf #{package_dir}"
  sh "mkdir -p #{package_dir}/lib/app"
  sh "cp lib/* #{package_dir}/lib/app/"
  sh "mkdir #{package_dir}/lib/ruby"
  sh "tar -xzf bin/traveling-ruby-#{TRAVELING_RUBY_VERSION[target]}-#{target}.tar.gz -C #{package_dir}/lib/ruby"
  sh "cp bin/wrapper.sh #{package_dir}/#{PACKAGE_NAME}"
  return unless ENV['DIR_ONLY']

  sh "tar -czf releases/#{package_dir}.tar.gz #{package_dir}"
  sh "rm -rf #{package_dir}"
end

def download_runtime(target)
  sh <<-SHELL
  cd bin && curl -L -O --fail https://d6r77u77i8pq3.cloudfront.net/releases/traveling-ruby-#{TRAVELING_RUBY_VERSION[target]}-#{target}.tar.gz
  SHELL
end
