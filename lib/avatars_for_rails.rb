
require 'paperclip'
#require 'ruby-debug'

module AvatarsForRails
 
  autoload :AvatarsControllerConfig,   'avatars_for_rails/avatars_controller_config'
 
  mattr_accessor :avatarable_model
  
   class << self
    def setup
      yield self
    end
   end
 
  class Engine < Rails::Engine
    
    config.to_prepare do
      AvatarsController.class_eval do 
        include AvatarsForRails::AvatarsControllerConfig
      end
    end
    
  end
  
end