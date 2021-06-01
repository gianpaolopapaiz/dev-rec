class OffersController < ApplicationController
  def show
    @offer = Offer.find(params[:id])
  end
  
  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.customer = current_customer
    if @offer.save
      redirect_to customer_path(current_customer)
    else
      render :new
    end
  end

  def destroy
    @offer = Offer.find(params[:id])
    @offer.destroy
    redirect_to customer_path(@offer.customer)
  end
  

  def accept_proposal
  end

  private

  def offer_params
    params.require(:offer).permit(:title, :description, :target_date)
  end
end
