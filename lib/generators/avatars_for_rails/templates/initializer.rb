AvatarsForRails.setup do |config|
  config.avatarable_model = :<%= file_name %>
end



module AvatarsForRails::AvatarsControllerConfig
  def current_avatarable_object
    return current_<%= file_name %>
  end
end