class AddressesController < ApplicationController

  def new
    @q = AddressMaster.search(params[:q])
    @master = @q.result(distinct: true).first

    if @q.result.count == 1     
      @address = Address.new(postal_code: @master[:postal_code])

      @address.postal_code = @master[:postal_code]
      @address.prefectural = Prefectural.find(@master[:prefectural_id].to_i).name
      @address.city = @master[:city]
      @address.street = @master[:street]

      render 'new'
    else
      @address = Address.new
      @address.prefectural = nil
      render 'new'
    end
  end

  def create
    @address = Address.new(address_params)
    @address.type = params[:type]
    if @address.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def address_params
    params.require(:address).permit(:postal_code, :prefectural, :city, :street, :building, :type)
  end
end