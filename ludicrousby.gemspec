lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ludicrousby/version'

Gem::Specification.new do |s|
  s.name = 'ludicrousby'
  s.version = Ludicrousby::VERSION
  s.platform = Gem::Platform::RUBY
  s.authors  = ['https://github.com/Chiether/ludicrousby/']
  s.email    = ['n-ishii+github@gmail.com']
  s.homepage = 'https://github.com/Chiether/ludicrousby/'
  s.summary     = 'ludicRoUsBY - ruby extensions.'
  s.description = 'slight ruby extensions. of course, its all ludicrous.'
  s.files         = `git ls-files`.split($/)
  s.executables   = s.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ['lib']
end

