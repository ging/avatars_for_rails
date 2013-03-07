class CreateAvatarsForRails<%= file_name.camelize %> < ActiveRecord::Migration
  def up    
    add_attachment :<%= file_name.tableize %>, :logo
  end
  
  def self.down
    remove_attachment :<%= file_name.tableize %>, :logo
  end
end
