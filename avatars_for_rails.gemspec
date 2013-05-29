$:.push File.expand_path("../lib", __FILE__)
require "avatars_for_rails/version" 

Gem::Specification.new do |s|
  s.name = "avatars_for_rails"
  s.version = AvatarsForRails::VERSION
  s.authors = ["Jaime Castro Montero", "GING"]
  s.summary = "Avatar manager for rails apps"
  s.description = "A Rails engine that allows any model to act as avatarable, permitting it to have a complete avatar manager"
  s.email = "social-stream@dit.upm.es"
  s.homepage = "http://github.com/ging/avatars_for_rails"

  s.files = `git ls-files`.split("\n")

  # Gem dependencies
  #
  s.add_runtime_dependency('jquery-rails', '>= 3.0.0')
  s.add_runtime_dependency('jquery-ui-rails', '>= 4.0.0')
  s.add_runtime_dependency('flashy', '~> 0.0.1')
  s.add_runtime_dependency('paperclip', '>= 2.3.4')

  if defined?(PLATFORM) && PLATFORM == 'java'
    s.add_runtime_dependency('rmagick4j','>= 0.3.0')
  else
    s.add_runtime_dependency('rmagick','>= 2.13.1')
  end

  # Development Gem dependencies
  #
  s.add_development_dependency('rails', '>= 3.1.0')
  # Testing database
  s.add_development_dependency('sqlite3-ruby')
  # Debugging
  s.add_development_dependency('debugger')
  # Specs
  s.add_development_dependency('rspec-rails', '>= 2.5.0')
  # Fixtures
  s.add_development_dependency('factory_girl', '~> 1.3.2')
  # Population
  s.add_development_dependency('forgery', '~> 0.3.6')
  # Integration testing
  s.add_development_dependency('capybara', '~> 0.3.9')
end

