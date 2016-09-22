class SimeisController < ApplicationController
  def new
    @simei=Simei.new
  end
  def create
    @simei = Simei.new(simei_params)
    if @simei.save
      redirect_to @simei
    else
      render 'new'
    end
  end
  def show # 追加
   @simei = Simei.find(params[:id])
  end

  private

  def simei_params
    params.require(:simei).permit(:name_sei, :name_mei, :kname_sei, :kneme_mei)
  end
end
