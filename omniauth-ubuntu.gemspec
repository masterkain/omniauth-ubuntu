# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth-ubuntu/version'

Gem::Specification.new do |gem|
  gem.name          = "omniauth-ubuntu"
  gem.version       = Omniauth::Ubuntu::VERSION
  gem.authors       = ["Claudio Poli"]
  gem.email         = ["masterkain@gmail.com\n"]
  gem.description   = %q{OmniAuth strategy for Ubuntu}
  gem.summary       = %q{OmniAuth strategy for Ubuntu}
  gem.homepage      = "https://github.com/masterkain/omniauth-ubuntu"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'omniauth', '~> 1.0'
end
