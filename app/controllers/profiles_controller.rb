class ProfilesController < ApplicationController
  include UsersHelper

  before_action :set_params, only: [:edit, :update]
  before_action :set_user, only: [:admin_new, :admin_create]
  before_action :admin_redirect, except: [:admin_new, :admin_create]

  def admin_new
    @profile = Profile.new
  end

  def admin_create
    @profile = Profile.new(profile_params)
    @profile.user_id = @user.id
    if @profile.save
      redirect_to @user
    else
      render 'admin_new'
    end
  end

  def new
    @user = User.new
    @profile = Profile.new
  end

  def create
    @user = User.new(user_params)
    @profile = Profile.new(profile_params)
    @user.admin = false
    create_transaction(@user, @profile)
    redirect_to @user
    rescue => e
    render 'new'
    ActiveRecord::Rollback
  end

  def edit
  end

  def update
    if @profile.update(profile_params) && @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  private
    def set_params
      @user = User.find(params[:user_id])
      @profile = Profile.find(params[:id])
    end

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confimation, :admin)
    end
   
    def profile_params
      params.require(:profile).permit(:user_id, :stuff_code)
    end

    def admin_redirect
      if Profile.find_by(user_id: current_user.id).nil?
        redirect_to new_admin_profile_path(current_user)
      end
    end
end
