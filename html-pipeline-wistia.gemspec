# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'html/pipeline/wistia/version'

Gem::Specification.new do |spec|
  spec.name          = "html-pipeline-wistia"
  spec.version       = HTML::Pipeline::Wistia::VERSION
  spec.authors       = ["Stan Luo", "Rick Benavidez"]
  spec.email         = ["stan001212@gmail.com", "rick@eighthbit.com"]

  spec.summary       = %q{Wistia filter for html-pipeline}
  spec.description   = %q{A html-pipeline filter that converts a wistia url into iframe}
  spec.homepage      = "https://github.com/rickbenavidez/html-pipeline-wistia"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "html-pipeline", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
end
