class AddressesController < ApplicationController

  def new
    @q = AddressMaster.search(params[:q])
    @master = @q.result(distinct: true).first

    if @q.result.count == 1
      @address = Address.new(postal_code: @master[:postal_code])

      @address.postal_code = @master[:postal_code]
      @address.prefectural = Prefectural.find(@master[:prefectural_id]).name
      params[:prefectural] = @address.prefectural
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
    @address.prefectural = params[:prefectural]
    @address.type = params[:type]
    if @address.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit

    @address = Address.find(params[:id])

    if params[:q].present? && params[:q]["postal_code_start"].present?
      begin
        @q = AddressMaster.search(params[:q])
        @master = @q.result(distinct: true).first
        @address.postal_code = @master[:postal_code]
        @address.prefectural = Prefectural.find(@master[:prefectural_id]).name
        params[:prefecture] = @address.prefectural
        @address.city = @master[:city]
        @address.street = @master[:street]
        @address.building = nil
      rescue =>e
        redirect_to edit_address_path(@address)
      end
    elsif params[:q].present?
      @q = AddressMaster.search(params[:q])
      @master = @q.result(distinct: true).first
      @address = Address.find(params[:id])
      @address.prefectural = nil
      @address.city = nil
      @address.street = nil
      @address.building = nil
      render 'edit'
    else
      @q = AddressMaster.search(@address.postal_code)
      @master = @q.result(distinct: true).first
      @q.postal_code_start = @address.postal_code
      render 'edit'
    end
  end

  def update
    @address = Address.find(params[:id])
    @address.postal_code = params[:address][:postal_code]
    @address.prefectural = params[:prefecture]
    @address.city = params[:address][:city]
    @address.street = params[:address][:street]
    if @address.update(address_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
  end

  private

  def address_params
    params.require(:address).permit(:postal_code, :prefectural, :city, :street, :building, :type)
  end
end