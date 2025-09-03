# frozen_string_literal: true

require_relative "lib/litera/version"

Gem::Specification.new do |spec|
  spec.name        = "litera"
  spec.version     = Litera::VERSION
  spec.authors     = ["Alejandro Gutiérrez"]
  spec.email       = ["alejandrodevs@gmail.com"]

  spec.summary     = "Rails engine dashboard for message tracking."
  spec.description = "Rails engine that provides a simple dashboard to track received messages in your application."
  spec.homepage    = "https://github.com/amco/litera-rb"
  spec.license     = "MIT"
  spec.required_ruby_version = ">= 3.2"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/blob/main/CHANGELOG.md"
  spec.metadata["rubygems_mfa_required"] = "true"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "pagy", ">= 8.0"
  spec.add_dependency "rails", ">= 6.0"
end
