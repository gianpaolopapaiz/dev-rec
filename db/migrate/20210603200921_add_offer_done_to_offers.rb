class AddOfferDoneToOffers < ActiveRecord::Migration[6.0]
  def change
    add_column :offers, :offer_done, :boolean, :default => false
  end
end
