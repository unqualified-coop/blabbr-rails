# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'blabbr/version'

Gem::Specification.new do |spec|
  spec.name          = "blabbr"
  spec.version       = Blabbr::VERSION
  spec.authors       = ["Mike Fogg"]
  spec.email         = ["mikefogg@blabbr.io"]

  spec.summary       = %q{Gem to wrap the Blabbr.io API}
  spec.description   = %q{Gem to wrap the Blabbr.io API}
  spec.homepage      = "http://blabbr.io"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"

  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"

  spec.add_dependency "faraday"
  spec.add_dependency "json"
end
