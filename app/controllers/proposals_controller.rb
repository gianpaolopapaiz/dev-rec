class ProposalsController < ApplicationController
  def new
    @proposal = Proposal.new
  end

  def new 
    @proposal = Proposal.new
    @offer = Offer.find(params[:offer_id])
  end

  def create
    @proposal = Proposal.new(proposal_params)
    @offer = Offer.find(params[:offer_id])
    @proposal.offer = @offer
    @proposal.developer = current_developer
    if @proposal.save
      redirect_to developer_path(current_developer)
    else
      render :new
    end
  end

  private

  def proposal_params
    params.require(:proposal).permit(:price, :estimated_date, :details)
  end
end
