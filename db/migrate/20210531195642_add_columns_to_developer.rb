class AddColumnsToDeveloper < ActiveRecord::Migration[6.0]
  def change
    add_column :developers, :name, :string
    add_column :developers, :skills, :text
    add_column :developers, :age, :integer
    add_column :developers, :years_experience, :integer
    add_column :developers, :github_url, :string
  end
end
