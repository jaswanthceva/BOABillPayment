# frozen_string_literal: true

$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "payment/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "payment"
  spec.version     = Payment::VERSION
  spec.authors     = ["Sahu"]
  spec.email       = ["minosahu31@gmail.com"]
  # spec.homepage    = "TODO"
  spec.summary     = 'Bills Payment ruby api'
  spec.description = "To interact with BillsPayment's API"
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 6.0.2", ">= 6.0.2.1"

  spec.add_dependency('sqlite3')

  spec.add_dependency('activesupport', '~> 6.0')
  spec.add_dependency('rest-client', '~> 2.1')

  spec.add_development_dependency('rake', '~> 11.2')
  spec.add_development_dependency('rspec', '~> 3.8')
  spec.add_development_dependency('rspec-its', '~> 1.3')
  spec.add_development_dependency('rubocop', '~> 0.77')
  spec.add_development_dependency('webmock', '~> 3.7')
end
