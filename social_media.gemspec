$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "social_media_concerns/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "social_media_concerns"
  spec.version     = SocialMediaConcerns::VERSION
  spec.authors     = ["Mike Heft"]
  spec.email       = ["mikeheft@gmail.com"]
  spec.homepage    = "https://github.com/mikeyduece/social_media_concerns"
  spec.summary     = "Add social media functionality to Rails applications"
  spec.description = "Adds liking, following, reporting, and blocking functionality to Rails applications"
  spec.license     = "MIT"
  spec.post_install_message = %q{Don't forget to copy the migrations with 'rails ocial_media:install:migrations', and to also include the relevant modules into their respective models}

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", ">= 5.0.0"

  spec.add_development_dependency "sqlite3"
end
