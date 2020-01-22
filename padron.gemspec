require_relative 'lib/padron/version'

Gem::Specification.new do |spec|
  spec.name          = "padron"
  spec.version       = Padron::VERSION
  spec.authors       = ["Facundo Diaz Martinez"]
  spec.email         = ["facundo_diaz_martinez@hotmail.com"]

  spec.summary       = "You could get public info from the desired CUIT"
  #spec.description   = %q{TODO: Write a longer description or delete this line.}
  spec.homepage      = "http://www.litecodesas.com"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  #spec.metadata["homepage_uri"] = spec.homepage
  #spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  #spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "savon", "~> 2.12"
  spec.add_dependency "httpi", "2.3"
  spec.add_dependency "nokogiri", "~> 1.10.4"
  spec.add_development_dependency "bundler", "~> 2.1"
  spec.add_development_dependency "rake", "~> 10.0"
end
