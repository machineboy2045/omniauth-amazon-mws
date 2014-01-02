# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth/amazon/version'

Gem::Specification.new do |spec|
  spec.name          = "omniauth-amazon"
  spec.version       = OmniAuth::Amazon::VERSION
  spec.authors       = ["Will Jensen"]
  spec.email         = ["machineboy2045@gmail.com"]
  spec.description   = %q{Login with Amazon MWS for OmniAuth 1.0}
  spec.summary       = %q{Login with Amazon MWS strategy for OmniAuth 1.0}
  spec.homepage      = "https://github.com/machineboy2045/omniauth-amazon"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'omniauth', '~> 1.0'

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'rspec', '~> 2.13'
  spec.add_development_dependency 'rack-test'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'webmock'
end
