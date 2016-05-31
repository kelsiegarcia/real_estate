class AddressesController < ApplicationController
  
  def index
    @addresses = Address.all
  end

  def show
    @address = Address.find(params[:id])
    @seller = Seller.find(params[:seller_id])
    @home = Home.find(params[:home_id])
  end

  def new
    @seller = Seller.find(params[:seller_id])
    @home = Home.find(params[:home_id])
    @address = Address.new
  end

  def create
    @seller = Seller.find(params[:seller_id])
    @home = Home.find(params[:home_id])
    @home.address = Address.new(address_params)
    if @home.save 
      flash[:success] = "Address with Listing name #{@home.name} created"
      redirect_to seller_home_path(@seller, @home)
    else
      render :new
    end
  end

  def edit
    @seller = Seller.find(params[:seller_id])
    @home = Home.find(params[:home_id])
    @address = Address.find(params[:address_id])
  end

  def update
    @seller = Seller.find(params[:seller_id])
    @home = Home.find(params[:address][:home_id])
    @address = Address.find(params[:id])
    if @address.update(address_params)
      redirect_to seller_home_address_path(id: @address.id, home_id: @home.id, seller_id: @seller.id)
    else
      render :edit
    end
  end

  def destroy
    @seller = Seller.find(params[:seller_id])
    @address = Address.find(params[:address_id])
    @address.destroy
    redirect_to seller_homes_path(@seller)
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


