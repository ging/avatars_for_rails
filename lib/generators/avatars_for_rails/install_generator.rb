#class AvatarsForRails::InstallGenerator < Rails::Generators::Base #:nodoc:
class AvatarsForRails::InstallGenerator < Rails::Generators::NamedBase #:nodoc:
  include Rails::Generators::Migration
  
  source_root File.expand_path('../templates', __FILE__)
  
  def create_initializer_file
    copy_file 'initializer.rb', 'config/initializers/avatars_for_rails.rb'
  end

  def copy_public
    directory "public"
  end

  
  require 'rails/generators/active_record'
  
  def self.next_migration_number(dirname)
    ActiveRecord::Generators::Base.next_migration_number(dirname)
  end
  
  def create_migration_file
    migration_template 'migration.rb', 'db/migrate/create_avatars_for_rails.rb'
  end
end