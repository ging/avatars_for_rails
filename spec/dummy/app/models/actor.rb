class Actor < ActiveRecord::Base
  
    has_many :avatars,
        :validate => true,
        :autosave => true
  
end
