class SellersController < ApplicationController
  before_action :seller, except: [:index, :new, :create]


  def index
    @sellers = Seller.all
  end

  def new
    @seller = Seller.new
  end

  def create
    @seller = Seller.new(seller_params)
    if @seller.save
      redirect_to seller_path(@seller)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @seller.update(seller_params)
      redirect_to seller_path(@seller)
    else
      render :edit
    end
  end

  def destroy
   seller_name = @seller.name
    @seller.destroy
    flash[:success] = "Seller with name: #{seller_name} destroyed!"
    redirect_to sellers_path
  end

    private

   def seller_params
    params.require(:seller).permit(:name, :seller_type, :seller_id)
   end 

   def seller
     @seller = Seller.find(params[:id])
   end

   # def home
   # end
end

