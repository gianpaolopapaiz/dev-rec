class AddRatinAvgToDeveloper < ActiveRecord::Migration[6.0]
  def change
    add_column :developers, :rating_avg, :integer
  end
end
