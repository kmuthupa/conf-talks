# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'version'

Gem::Specification.new do |gem|
  gem.name          = "conf-talks"
  gem.version       = ConfBuilder::VERSION
  gem.authors       = ["Karthik Muthupalaniappan"]
  gem.email         = ["karthik.swaminathan@gmail.com"]
  gem.description   = %q{This gem is the solution to the conference talks problem}
  gem.summary       = %q{This gem is the solution to the conference talks problem. Uses a yml to feed in the list of talks.}
  gem.homepage      = "http://www.karthikmuthu.in"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "rake"
  gem.add_dependency "minitest"
  gem.add_dependency "minitest-matchers"
end
