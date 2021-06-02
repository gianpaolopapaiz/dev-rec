class RemoveBooleanFromOffers < ActiveRecord::Migration[6.0]
  def change
    remove_column :offers, :boolean, :boolean
  end
end
