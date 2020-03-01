require_relative 'lib/chalender/version'

Gem::Specification.new do |spec|
  spec.name          = "chalender"
  spec.version       = Chalender::VERSION
  spec.authors       = ["David Georgiou"]
  spec.email         = ["david.georgiou@gmail.com"]

  spec.summary       = %q{ruby implementation of cal}
  spec.homepage      = "https://github.com/d-a-v-e/chalender"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = 'https://rubygems.org'

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/d-a-v-e/chalender"
  spec.metadata["changelog_uri"] = "https://github.com/d-a-v-e/chalender"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # dependencies
  spec.add_dependency 'thor', '~>1.0.1'
end
