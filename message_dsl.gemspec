# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'message_dsl/version'

Gem::Specification.new do |gem|
  gem.name          = "message_dsl"
  gem.version       = MessageDsl::VERSION
  gem.authors       = ["Daniel Gong"]
  gem.email         = ["daniel@strikingly.com"]
  gem.description   = %q{A DSL that unifies the message format of RESTful API responses and job results.}
  gem.summary       = %q{a DSL that unifies the message format of RESTful API responses and job results.}
  gem.homepage      = "https://github.com/strikingly/message_dsl"
  gem.license       = "MIT"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency 'bundler', '~> 1.3'
  gem.add_development_dependency 'rake'

  gem.add_development_dependency "redis"
end
