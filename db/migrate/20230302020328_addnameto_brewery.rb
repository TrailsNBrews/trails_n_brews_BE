class AddnametoBrewery < ActiveRecord::Migration[5.2]
  def change
    add_column :breweries, :name, :string
  end
end
