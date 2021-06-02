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

  def accept_proposal
    accepted_proposal = Proposal.find(params[:proposal_id])
    offer = accepted_proposal.offer
    customer = offer.customer
    offer.proposals.each do |proposal|
      if proposal == accepted_proposal
        proposal.status = 'accepted'
      else
        proposal.status = 'rejected'
      end
      proposal.save
    end
    if offer.save
      redirect_to customer_offer_path(customer, offer)
    else
      redirect_to customer_offer_path(customer, offer), notice: 'Unable to update!'
    end
  end

  private

  def proposal_params
    params.require(:proposal).permit(:price, :estimated_date, :details)
  end
end
