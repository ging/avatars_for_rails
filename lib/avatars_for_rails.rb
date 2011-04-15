
require 'paperclip'
#require 'ruby-debug'

module AvatarsForRails
 
  mattr_accessor :avatarable_model
  
   class << self
    def setup
      yield self
    end
   end
 
  class Engine < Rails::Engine
    
    config.to_prepare do
      class AvatarsController 
        include AvatarsControllerConfig
      end
    end
    
  end
  
end