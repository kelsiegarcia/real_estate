class HomesController < ApplicationController
  before_action :seller
  before_action :home, only: [:show, :edit, :update, :destroy]

  def index
    @homes = @seller.homes
  end

  def new
    @home = Home.new
  end

  def create
    @home = @seller.homes.new(home_params)
    if @home.save
      flash[:success] = "Home with name #{@home.name} created"
      redirect_to seller_home_path(@seller, @home)
    else
      render :new
    end
  end

  def show
    @address = @home.address
  end

  def edit
  end

  def update
    if @home.update(home_params)
      flash[:success] = "Home with name #{@home.name} updated"
      redirect_to seller_home_path(@seller, @home)
    else
      render :edit
    end
  end

  def destroy
    name = @home.name
    @home.destroy
    flash[:success] = "Home with name #{@home.name} destroyed"
    redirect_to seller_homes_path(@seller, @home)
  end

  private

    def home_params
      params.require(:home).permit(
      :name, :amount, :bed, :bath, :square_footage, :sold)
    end

    def home
      @home = Home.find(params[:id])
    end

    def seller
      @seller = Seller.find(params[:seller_id])
    end
end
