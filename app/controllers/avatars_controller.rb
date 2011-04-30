class AvatarsController < ApplicationController
  
  before_filter :apply_existing_filters
  
  def index
    @avatars = current_avatarable_object.avatars

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def new
    @avatars = Avatar.all
    @avatar = Avatar.create(params[:avatar])

    if params[:drag_name].blank?
      respond_to do |format|
        format.html # new.html.erb
      end
    else
      if Avatar.check_image_tmp_valid(params[:drag_name].to_s)
        render :partial => 'precrop'
      else
        @avatar.logo.errors['invalid_type'] = I18n.t('avatar.error.no_image_file')
        render :partial => 'errors'
      end
    end

  end

  def update

    if !current_avatarable_object.avatars.blank?

      new_logo = Avatar.find(params[:id])

      if (new_logo.avatarable == current_avatarable_object)
        actual_logo = current_avatarable_object.avatars.active.first
        unless actual_logo.blank?
          return if new_logo == actual_logo
          old_logo_id = actual_logo.id
          current_avatarable_object.avatars.each do |old_logo|
            old_logo.active = false
            old_logo.save
          end
        else
          old_logo_id = params[:id].to_s
        end

        new_logo.active = true
        new_logo.save

        respond_to do |format|
          format.js { render :layout=>false , :locals=>{:new_id => params[:id],:old_id => old_logo_id}}
        end

      end
    end
  end

  def create
    @avatar = current_avatarable_object.avatars.create(params[:avatar])

    if @avatar.new_record?
      if (params[:avatar].blank? || params[:avatar][:drag].nil?)
        render :new, :layout => false
      else
        render :json => {:name => File.basename(@avatar.logo.queued_for_write[:original].path) }
      end
    else
      redirect_to avatars_path
    end
  end

  def destroy
    @avatar = Avatar.find(params[:id])

    if (@avatar.avatarable == current_avatarable_object)
      @avatar.destroy
      respond_to do |format|
        format.js { render :layout=>false , :locals=>{:deleted_id => params[:id]}}
      end
    end
  end

  def current_avatarable_object
    __send__ AvatarsForRails.current_avatarable_object
  end
  
  def apply_existing_filters
    AvatarsForRails.avatarable_filters.each do |filter|
      __send__ filter
    end
  end
  
end
