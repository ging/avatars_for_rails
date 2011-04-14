
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
  end
  
end