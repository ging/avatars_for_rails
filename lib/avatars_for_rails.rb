
require 'paperclip'
#require 'ruby-debug'

module AvatarsForRails
 
  #autoload :AvatarsControllerConfig,   'avatars_for_rails/avatars_controller_config'
 
  mattr_accessor :avatarable_model
  mattr_accessor :current_avatarable_object
  mattr_accessor :avatarable_filters
  mattr_accessor :avatarable_styles
  mattr_accessor :tmp_path
  @@tmp_path = File.join('public', 'images', 'tmp')
  
   class << self
    def setup
      yield self
    end


   end

  class Engine < Rails::Engine
=begin    
    config.to_prepare do   
      AvatarsController.class_eval do 
        #include AvatarsForRails::AvatarsControllerConfig
        include AvatarsControllerConfig
      end      
    end
=end      
  end

end
