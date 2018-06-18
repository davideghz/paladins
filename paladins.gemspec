
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "paladins/version"

Gem::Specification.new do |spec|
  spec.name          = "paladins"
  spec.version       = Paladins::VERSION
  spec.authors       = ["Davide Ghezzi"]
  spec.email         = ["davideghz@gmail.com"]

  spec.summary       = %q{Ruby wrapper for Paladins API.}
  spec.description   = %q{Ruby wrapper for Hi-Rez Studios Paladins API.}
  spec.homepage      = "https://www.github.com/davideghz/paladins"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"

  spec.add_dependency "faraday"
  spec.add_dependency "json"
end
