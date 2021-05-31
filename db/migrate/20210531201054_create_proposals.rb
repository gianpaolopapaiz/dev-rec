class CreateProposals < ActiveRecord::Migration[6.0]
  def change
    create_table :proposals do |t|
      t.references :offer, null: false, foreign_key: true
      t.references :developer, null: false, foreign_key: true
      t.float :price
      t.date :estimated_date
      t.text :details
      t.string :status, :default => "pending"

      t.timestamps
    end
  end
end
