# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'guerrillamail/version'

Gem::Specification.new do |spec|
  spec.name          = "guerrillamail"
  spec.version       = Guerrillamail::VERSION
  spec.authors       = ["Andrei Gliga"]
  spec.email         = ["gems@prod.net"]

  spec.summary       = %q{GuerrillMail API client}
  spec.description   = %q{GuerrillMail API client}
  spec.homepage      = "http://github.com/otzy007/guerrillamail"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'rest-client'

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
