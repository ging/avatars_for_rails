class ApplicationController < ActionController::Base
  protect_from_forgery
    
    def current_actor
        return Actor.find(:all).first
    end
    
end
