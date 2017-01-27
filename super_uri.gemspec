# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'super_uri/version'

Gem::Specification.new do |spec|
  spec.name          = "super_uri"
  spec.version       = SuperUri::VERSION
  spec.authors       = ["Konstantin Gredeskoul, Rob Nichols"]
  spec.email         = ["rob@undervale.co.uk"]

  spec.summary       = %q{Provides read/write/delete actions for wide range of URI schemes}
  spec.description   = %q{Provides read/write/delete actions for wide range of URI schemes such as file://, env://, etc?}
  spec.homepage      = "https://github.com/reggieb/super_uri"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
