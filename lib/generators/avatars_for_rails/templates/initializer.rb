AvatarsForRails.setup do |config|
  config.avatarable_model = :<%= file_name %>
  config.current_avatarable_object = :current_<%= file_name %>
end