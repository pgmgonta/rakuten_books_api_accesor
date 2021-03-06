# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rakuten_books_api_accesor/version'

Gem::Specification.new do |spec|
  spec.name          = "rakuten_books_api_accesor"
  spec.version       = RakutenBooksApiAccesor::VERSION
  spec.authors       = ["pgmgonta"]
  spec.email         = ["pgm.gonta@gmail.com"]
  spec.description   = %q{Rakuten Books API Accesor}
  spec.summary       = %q{Rakuten Books API Accesor}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "json", "~>1.7.7"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "simplecov-rcov"
end
