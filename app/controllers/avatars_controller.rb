class AvatarsController < ApplicationController
  # Apply the filters configured in avatars_for_rails initializer
  AvatarsForRails.controller_filters.each do |filter|
    before_filter filter
  end

  def update
    if current_avatarable.update_attributes avatarable_params
      respond_to do |format|
        format.html { redirect_to request.referrer || root_path }
        format.json { render json: { redirect_path: request.referrer || root_path } }
      end
    elsif current_avatarable.errors[:logo_crop]
      render json: { crop: render_to_string(partial: 'crop', object: current_avatarable, as: :avatarable) }.to_json
    else
      render json: current_avatarable.errors.to_json
    end
  end

  def destroy
  end

  private

  def current_avatarable
    send AvatarsForRails.controller_avatarable
  end

  def avatarable_params
    params.
      require(current_avatarable.class.to_s.underscore).
      permit(:logo,
             :logo_crop_x,
             :logo_crop_y,
             :logo_crop_w,
             :logo_crop_h,
             :avatar_tmp_basename)
  end
end
