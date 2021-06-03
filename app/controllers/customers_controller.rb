class CustomersController < ApplicationController
  def show
    @offers_open = current_customer.offers.where(offer_open: true)
    @offers_accepted = current_customer.offers.where('offer_open = false AND offer_done = false')
    @offers_closed = current_customer.offers.where(offer_done: true)
  end
end
