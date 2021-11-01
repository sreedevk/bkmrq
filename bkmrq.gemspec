Gem::Specification.new do |s|
  s.name        = 'bkmrq'
  s.version     = '0.0.1'
  s.licenses    = ['MIT']
  s.summary     = 'Export your browser bookmarks to markdown!'
  s.description = 'Bkmrq Converts Bookmarks stored by your browser in JSON format to a readable markdown format'
  s.authors     = ['Sreedev Kodichath']
  s.email       = 'sreedevpadmakumar@gmail.com'
  s.files       = ['lib/cli.rb', 'lib/bkmrq.rb', 'lib/docs_template.rb']
  s.executables = ['bin/bkmrq.sh']
  s.homepage    = 'https://rubygems.org/gems/bkmrq'
  s.metadata    = { 'source_code_uri' => 'https://github.com/sreedevk/bkmrq' }
end
