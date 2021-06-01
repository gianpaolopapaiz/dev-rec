class DevelopersController < ApplicationController
  def show
    @developer = Developer.find(params[:id])
    @offers = Offer.all
  end
  
end
