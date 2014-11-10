# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dhl_express/version'

Gem::Specification.new do |spec|
  spec.name          = "dhl_express"
  spec.version       = DhlExpress::VERSION
  spec.authors       = ["Sebastian Szturo"]
  spec.email         = ["s.szturo@me.com"]
  spec.description   = "Gem to access international DHL Express Services."
  spec.summary       = "Gem to access international DHL Express Services."
  spec.homepage      = "http://github.com/SebastianSzturo/dhl_express"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "nokogiri"
  spec.add_dependency "chronic"
  spec.add_dependency "typhoeus"
  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "vcr"
end
