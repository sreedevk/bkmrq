Gem::Specification.new do |s|
  s.name          = 'bkmrq'
  s.version       = '0.0.4'
  s.licenses      = ['MIT']
  s.summary       = 'Export your browser bookmarks to markdown!'
  s.description   = 'Bkmrq Converts Bookmarks stored by your browser in JSON format to a readable markdown format'
  s.authors       = ['Sreedev Kodichath']
  s.email         = 'sreedevpadmakumar@gmail.com'
  s.homepage      = 'https://rubygems.org/gems/bkmrq'
  s.metadata      = { 'source_code_uri' => 'https://github.com/sreedevk/bkmrq' }
  s.executables   = ['bkmrq']
  s.require_paths = ['lib']
  s.files         = [
    'lib/bkmrq.rb',
    'lib/bkmrq/app.rb',
    'lib/bkmrq/browser_config.rb',
    'lib/bkmrq/cli.rb',
    'lib/bkmrq/docs_template.rb',
    'lib/bkmrq/manual.rb'
  ]
end
