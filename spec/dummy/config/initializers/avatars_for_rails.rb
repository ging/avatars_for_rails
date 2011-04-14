AvatarsForRails.setup do |config|

    config.avatarable_model = :actor

end

AvatarsController

class AvatarsController
  
  def current_avatarable_object
    return current_<%= file_name %>
  end
  
end