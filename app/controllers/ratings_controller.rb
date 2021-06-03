class RatingsController < ApplicationController

  def new
    @rating = Rating.new
    @proposal = Proposal.find(params[:proposal_id])
    @developer = @proposal.developer
  end

  def create
  end

  def destroy
  end

end
