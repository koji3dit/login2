class ProfilesController < ApplicationController
  #before_action :authenticate_user!, except: [:new, :create]

  def profile
  end

  def new
    @user = User.new
    @profile = Profile.new
  end

  def create
    @user = User.new(user_params)
    @profile = Profile.new(profile_params)
    @user.transaction do
      @user.admin = false
      if @user.save
        @profile.user_id = @user.id
        profile_save
      else
        render 'new'
      end
    end
  end
  
  def edit
    @user = User.find(params[:user_id])
    @profile = Profile.find(params[:profile_id])
  end
    
    
    

  private
   def user_params
     params.require(:user).permit(:name, :email, :password, :password_confimation, :admin)
   end
   
  def profile_params
    params.require(:profile).permit(:user_id)
  end

  # def simei_params
  #   params.require(:simei).permit(:name_sei, :name_mei, :kname_sei, :kneme_mei)
  # end
   
  def profile_save
    if @profile.save
      redirect_to @user
    else
      render 'new'
      raise ActiveRecord::Rollback
    end
  end

end
