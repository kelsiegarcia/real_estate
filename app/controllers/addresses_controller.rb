class AddressesController < ApplicationController
  
  def index
    @addresses = Address.all
  end

  def show
     @address = @seller.home.address.find(params[:id])
  end

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    if @address.save 
      redirect_to addresses_path(@address)
    else
      render :new
    end
  end

  def edit
    @address = Address.find(address_params)
  end

  def update
    @home = Home.find(params[:address][:home_id])
    @address = Address.find(params[:id])
    if @address.update(address_params)
      redirect_to address_path(id: @address.id, home_id: @home.id)
    else
      render :edit
    end
  end

  def destroy
    Address.find(params[:id]).destroy
    redirect_to addresses_path
  end

  private

  def address_params
    params.require(:address).permit(
      :street, :city, :state, :zip)
  end

  def address
    @address = @home.address.find(params[:id])
  end
  def home
      @home = @seller.homes.find(params[:id])
    end

  def seller
      @seller = Seller.find(params[:seller_id])
  end
end


