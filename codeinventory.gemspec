# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'codeinventory/version'

Gem::Specification.new do |spec|
  spec.name          = "codeinventory"
  spec.version       = CodeInventory::VERSION
  spec.authors       = ["Jeff Fredrickson"]
  spec.email         = ["jeffrey.fredrickson@gsa.gov"]

  spec.summary       = %q{Harvests project metadata from an agency's repositories to build a code inventory.}
  spec.description   = %q{Harvests project metadata from an agency's repositories to build a code inventory. This helps agencies comply with the Federal Source Code Policy.}
  spec.homepage      = "https://github.com/jfredrickson5/codeinventory"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "webmock", "~> 2.1"
  spec.add_development_dependency "octokit", "~> 4.6"
  spec.add_development_dependency "pry", "~> 0.10"
end
