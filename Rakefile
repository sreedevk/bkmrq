# frozen_string_literal: true

namespace :bkmrq do
  desc 'rebuild gem'
  task :build do
    sh('gem build bkmrq.gemspec')
  end

  desc 'install gem'
  task :install do
    sh('gem install --local bkmrq-*.gem')
  end

  desc 'remove gem'
  task :uninstall do
    sh('gem uninstall bkmrq')
  end

  desc 'clean generated files'
  task :clean do
    sh('rm -rf bkmrq*.md')
  end
end
