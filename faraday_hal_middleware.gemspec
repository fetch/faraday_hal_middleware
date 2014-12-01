# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'faraday_hal_middleware/version'

Gem::Specification.new do |spec|
  spec.name          = 'faraday_hal_middleware'
  spec.version       = FaradayHalMiddleware::VERSION
  spec.authors       = ['Koen Punt']
  spec.email         = ['koen@fetch.nl']
  spec.summary       = %q{Faraday Middleware for JSON HAL requests and responses}
  spec.description   = %q{Faraday Middleware for JSON HAL requests and responses}
  spec.homepage      = 'https://github.com/fetch/faraday_hal_middleware'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.6'

  spec.add_dependency 'faraday_middleware', ['>= 0.9', '< 0.10']

end
