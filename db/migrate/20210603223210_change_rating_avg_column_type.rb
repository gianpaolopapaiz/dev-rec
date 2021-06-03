class ChangeRatingAvgColumnType < ActiveRecord::Migration[6.0]
  def change
    change_column :developers, :rating_avg, :float
  end
end
