module AvatarsForRails
  class Engine < Rails::Engine
    initializer "avatars_for_rails.active_record" do
      ActiveSupport.on_load(:active_record) do
        extend AvatarsForRails::ActiveRecord
      end
    end

    initializer "avatars_for_rails.create_tmp_dir" do
      FileUtils.mkdir_p AvatarsForRails.tmp_path
    end
  end
end
