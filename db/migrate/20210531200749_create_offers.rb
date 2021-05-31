class CreateOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :offers do |t|
      t.references :customer, null: false, foreign_key: true
      t.text :description
      t.date :target_date
      t.boolean :open

      t.timestamps
    end
  end
end
