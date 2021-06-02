class FixColumnOpen < ActiveRecord::Migration[6.0]
  def change
    rename_column :offers, :open, :offer_open
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
