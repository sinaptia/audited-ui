require_relative "lib/audited/ui/version"

Gem::Specification.new do |spec|
  spec.name = "audited-ui"
  spec.version = Audited::Ui::VERSION
  spec.authors = ["Patricio Mac Adden"]
  spec.email = ["patriciomacadden@gmail.com"]
  spec.homepage = "https://github.com/sinaptia/audited_ui"
  spec.summary = "A UI for Audited."
  spec.description = "A UI for Audited."

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "audited", ">= 5.0.0"
  spec.add_dependency "kaminari"
  spec.add_dependency "rails", ">= 5.0.0"
  spec.add_dependency "ransack"

  spec.add_development_dependency "standardrb"
end
