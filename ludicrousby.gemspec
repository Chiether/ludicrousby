lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ludicrousby/version'

Gem::Specification.new do |s|
  s.name = 'ludicrousby'
  s.version = Ludicrousby::VERSION
  s.platform = Gem::Platform::RUBY
  s.authors  = ['none']
  s.email    = ['none@example.com']
  s.homepage = 'https://www.example.com'
  s.summary     = ''
  s.description = ''
  s.files         = `git ls-files`.split($/)
  s.executables   = s.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]
end

