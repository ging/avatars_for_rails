class AvatarsForRails::InstallGenerator < Rails::Generators::NamedBase #:nodoc:
  include Rails::Generators::Migration
  
  source_root File.expand_path('../templates', __FILE__)
  
  require 'rails/generators/active_record'
  
  def create_initializer_file
    template 'initializer.rb', 'config/initializers/avatars_for_rails.rb'
  end
  
  def self.next_migration_number(dirname)
    ActiveRecord::Generators::Base.next_migration_number(dirname)
  end
  
  def create_migration_file
    migration_template 'migration.rb', 'db/migrate/create_avatars_for_rails_' + file_name + '.rb'
  end

  def require_javascripts
    inject_into_file 'app/assets/javascripts/application.js',
                     "//= require avatars_for_rails\n",
                     :before => '//= require_tree .'
  end

  def require_stylesheets
    inject_into_file 'app/assets/stylesheets/application.css',
                     " *= require avatars_for_rails\n",
                     :before => ' *= require_tree .'
  end
end
