# Provide a simple gemspec so you can easily use your enginex
# project in your rails apps through git.
Gem::Specification.new do |s|
  s.name = "avatars_for_rails"
  s.version = "0.2.9"
  s.authors = ["Jaime Castro Montero", "GING"]
  s.summary = "Avatar manager for rails apps."
  s.description = "A Rails engine that allows any model to act as avatarable, permitting it to have a complete avatar manager with a few options. Adapted to rails 3"
  s.email = "social-stream@dit.upm.es"
  s.homepage = "http://github.com/ging/avatars_for_rails"
  s.files = `git ls-files`.split("\n")
  #s.files = Dir["{app,lib,config}/**/*"] + ["MIT-LICENSE", "Rakefile", "Gemfile", "README.rdoc"]
  # Gem dependencies
  #
  s.add_runtime_dependency('jquery-rails', '>= 1.0.9')
  # SQL foreign keys
  s.add_runtime_dependency('foreigner', '>= 0.9.1')
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
  if RUBY_VERSION < '1.9'
    s.add_development_dependency('ruby-debug', '~> 0.10.3')
  end
  # Specs
  s.add_development_dependency('rspec-rails', '~> 2.5.0')
  # Fixtures
  s.add_development_dependency('factory_girl', '~> 1.3.2')
  # Population
  s.add_development_dependency('forgery', '~> 0.3.6')
  # Integration testing
  s.add_development_dependency('capybara', '~> 0.3.9')

end

