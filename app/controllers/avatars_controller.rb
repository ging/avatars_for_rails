#class AvatarsController < InheritedResources::Base
class AvatarsController < ApplicationController


  def index
    @avatars = Avatar.all

    respond_to do |format|
      format.html # index.html.erb
      #format.xml { render :xml => @gastos }
    end
  end
  
    def new
    @avatars = Avatar.all

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def update
debugger
=begin
  current_subject = Actor.find(:all).first
    if !current_subject.avatars.blank?

      new_logo = Avatar.find(params[:id])

      if (new_logo.actor == current_subject.actor)

        actual_logo = current_subject.avatars.active.first
        if !actual_logo.blank?
        actual_logo.active = false
        actual_logo.save
        end

      new_logo.active = true
      new_logo.save
      end
    end
=end
    redirect_to avatars_path
  end

  def create
    @avatar = Avatar.create(params[:avatar])
  #  current_subject = Actor.find(:all).first
    if @avatar.new_record?
      render :new
    else
      @avatar.updating_logo = true
      #@avatar.actor_id = current_subject.actor.id
      #if !current_subject.avatars.blank?
      #  actual_logo = current_subject.avatars.active.first
      #actual_logo.active = false
      #actual_logo.save
      #end
      @avatar.active = true
      @avatar.save
      redirect_to avatars_path
    #redirect_to [current_subject, :profile]
    end
  end


end
