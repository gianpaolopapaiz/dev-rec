class RatingsController < ApplicationController

  def new
    @rating = Rating.new
    @proposal = Proposal.find(params[:proposal_id])
    @developer = @proposal.developer
  end

  def create
    @rating = Rating.new(rating_params)
    @proposal = Proposal.find(params[:proposal_id])
    @rating.customer_id = current_customer.id
    @rating.developer_id = @proposal.developer.id
    @developer = @proposal.developer
    @offer = Offer.find(@proposal.offer.id)

    if @rating.save
      @offer.offer_done = true
      @offer.save

      @ratings = Rating.where(developer: @developer)
      soma = 0
      count = 0
      @ratings.each do |r| 
        soma += r.rating
        count += 1
      end
      @developer.rating_avg = soma / count
      @developer.save

      redirect_to customer_path(current_customer)
    else
      render :new
    end
  end

  

  def destroy
  end


  def rating_params
    params.require(:rating).permit(:rating, :comment)
  end

end
