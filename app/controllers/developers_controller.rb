class DevelopersController < ApplicationController
  def show
    @developer = Developer.find(params[:id])
    @available_offers = Offer.where(offer_open: true)
    @query = params[:query]
    if @query.present?
      sql_query = "title ILIKE :query OR description ILIKE :query AND offer_open = true"
      @available_offers = Offer.where(sql_query, query: "%#{params[:query]}%")
    end
  end
  
end
