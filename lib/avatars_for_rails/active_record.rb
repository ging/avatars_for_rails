module AvatarsForRails
  module ActiveRecord
    # Adds an ActiveRecord model with support for avatars
    def acts_as_avatarable(options = {})
      options[:styles] ||= AvatarsForRails.avatarable_styles

      cattr_accessor :avatarable_options
      self.avatarable_options = options

      include AvatarsForRails::Avatarable
    end
  end
end
