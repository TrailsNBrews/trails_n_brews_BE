class EditBreweryIdName < ActiveRecord::Migration[5.2]
  def change
    rename_column :user_breweries, :brew_id, :brewery
  end
end
