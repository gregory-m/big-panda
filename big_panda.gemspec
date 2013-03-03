# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'big_panda/version'

Gem::Specification.new do |gem|
  gem.name          = "big-panda"
  gem.version       = BigPanda::VERSION
  gem.authors       = ["Gregory Man"]
  gem.email         = ["man.gregory@gmail.com"]
  gem.description   = %q{A Ruby interface to the Big Panda API}
  gem.summary       = gem.description
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency 'multi_json', '~> 1.6'
  gem.add_runtime_dependency 'faraday_middleware', '~> 0.9'

  gem.add_development_dependency 'rspec', '~> 2.13'
  gem.add_development_dependency 'webmock', '~> 1.10'
  gem.add_development_dependency 'vcr', '~> 2.4'
end