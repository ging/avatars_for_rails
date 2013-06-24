module AvatarsForRails
  module Avatarable
    extend ActiveSupport::Concern

    included do
      cattr_accessor :logo_aspect_ratio
      self.logo_aspect_ratio = 1

      attr_accessor :logo_crop, :logo_crop_x, :logo_crop_y, :logo_crop_w, :logo_crop_h,
                    :avatar_tmp_basename

      has_attached_file :logo, avatarable_options

      before_validation :validate_crop_params, :crop_avatar,
                        :check_avatar_aspect_ratio
    end

    def avatar_tmp_public_path(root_path)
      return unless avatar_tmp_file?

      File.join(root_path, AvatarsForRails.public_tmp_path, @avatar_tmp_basename)
    end

    private

    def avatar_tmp_file?
      avatar_tmp_basename.present? &&
        File.exists?(avatar_tmp_full_path)
    end


    def check_avatar_aspect_ratio
      return if logo.queued_for_write[:original].blank?

      cp_avatar_to_tmp_path

      dimensions = avatar_tmp_file_dimensions

      return if dimensions.first == dimensions.last 

      errors.add :logo_crop
    end

    def validate_crop_params
      return if logo_crop_x.blank?

      %w( x y w ).each do |attr|
        send "logo_crop_#{ attr }=", send("logo_crop_#{ attr }").to_f
      end

      if logo_crop_w == 0
        errors.add(:logo_crop_w, 'avatar.error.no_width')
      end
    end

    def crop_avatar
      return unless logo_crop_x.present? && avatar_tmp_file?

      width, height = avatar_tmp_file_dimensions

      crop_x = (logo_crop_x * width).round
      crop_y = (logo_crop_y * height).round
      crop_w = (logo_crop_w * width).round
      crop_h = crop_w / self.class.logo_aspect_ratio

      avatar_magick_image.crop!(crop_x, crop_y, crop_w, crop_h)

      avatar_magick_image.write(avatar_tmp_full_path)

      self.logo = File.open(avatar_tmp_full_path)

      FileUtils.remove_file(avatar_tmp_full_path)
    end

    def avatar_tmp_full_path
      return if avatar_tmp_basename.blank?

      AvatarsForRails.tmp_path avatar_tmp_basename
    end

    def avatar_tmp_file_dimensions
      [ avatar_magick_image.columns,
        avatar_magick_image.rows ]
    end

    def avatar_magick_image
      @avatar_magick_image ||=
        Magick::Image.read(avatar_tmp_full_path).first
    end

    def cp_avatar_to_tmp_path
      FileUtils.cp logo.queued_for_write[:original].path, AvatarsForRails.tmp_path

      @avatar_tmp_basename = File.basename(logo.queued_for_write[:original].path)

      FileUtils.chmod(0644, avatar_tmp_full_path)
    end
  end
end
