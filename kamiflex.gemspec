$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "kamiflex/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "kamiflex"
  spec.version     = Kamiflex::VERSION
  spec.authors     = ["etrex kuo"]
  spec.email       = ["et284vu065k3@gmail.com"]
  spec.homepage    = "https://github.com/etrex/kamiflex"
  spec.summary     = "Kamiflex: generate JSON objects for Line flex message with a Builder-style DSL"
  spec.description = "Kamiflex provide you a clear way to manage your flex message. It's easy to build an complex flex message with conditionals and loops."
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 5.2.2"
end
