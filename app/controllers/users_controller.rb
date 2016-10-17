class UsersController < ApplicationController
    before_action :reject_without_admin

  def index
     @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def reject_without_admin
    redirect_to root_path unless (current_user && current_user.admin == true)
  end
end
