# -*- encoding: utf-8 -*-
require File.expand_path('../lib/ndlib-on-rspec/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = [
    "Jeremy Friesen"
  ]
  gem.email         = [
    "jeremy.n.friesen@gmail.com"
  ]
  gem.description   = %q{A handful of helpful Rspec matchers intended for reuse}
  gem.summary       = %q{A handful of helpful Rspec matchers intended for reuse}
  gem.homepage      = "http://github.com/ndlib/ndlib-on-rspec"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "ndlib-on-rspec"
  gem.require_paths = ["lib"]
  gem.version       = NdlibOnRspec::VERSION

  gem.add_runtime_dependency(%q<rspec>, [">= 2.6.1"])
end
