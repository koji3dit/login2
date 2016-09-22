class ProfilePagesController < ApplicationController
  def profile
  end

  def new
    @user = User.find(params[:user_id])
    @profile
    #@simei= Simei.new
  end

  def create
    @simei=Simei.new(simei_parms)
     if @user.save && @simei.save
       redirect_to ' profile_pages_show_path'
     else
        render 'new'
     end
  end

  private
   def user_params
     params.require(:user).permit(:name)
   end
   def simei_params
    params.require(:simei).permit(:name_sei, :name_mei, :kname_sei, :kneme_mei)
   end
   
   user

end
