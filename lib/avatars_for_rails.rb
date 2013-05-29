require 'RMagick'
require 'jquery-rails'
require 'jquery-ui-rails'
require 'flashy'
require 'paperclip'

module AvatarsForRails
  autoload :ActiveRecord, 'avatars_for_rails/active_record'
  autoload :Avatarable,   'avatars_for_rails/avatarable'

  # Filters to run before updating the avatar
  mattr_accessor :controller_filters
  @@controller_filters = [ :authenticate_user! ]

  # The method to get the avatarable in the controller
  mattr_accessor :controller_avatarable
  @@controller_avatarable = :current_user

  # The default styles that will be generated
  mattr_accessor :avatarable_styles
  @@avatarable_styles = { small:  '50x50',
                          medium: '120x120' }

  # The tmp path inside public/
  mattr_accessor :public_tmp_path
  @@public_tmp_path = File.join('system', 'tmp')
  
  class << self
    def setup
      yield self
    end

    def tmp_path file = ""
      File.join(Rails.root, 'public', public_tmp_path, file)
    end
  end
end

require 'avatars_for_rails/engine'
