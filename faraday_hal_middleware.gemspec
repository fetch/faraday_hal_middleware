# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'faraday/hal_json/version'

Gem::Specification.new do |spec|
  spec.name          = 'faraday_hal_middleware'
  spec.version       = Faraday::HalJson::VERSION
  spec.authors       = ['Koen Punt']
  spec.email         = ['koen@fetch.nl']
  spec.summary       = 'Faraday Middleware for JSON HAL requests and responses.'
  spec.description   = 'Faraday Middleware for JSON HAL requests and responses.'
  spec.homepage      = 'https://github.com/fetch/faraday_hal_middleware'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'faraday', '~> 2.0'
  spec.metadata['rubygems_mfa_required'] = 'true'
end
