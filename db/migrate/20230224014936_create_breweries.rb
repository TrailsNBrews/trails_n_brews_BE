class CreateBreweries < ActiveRecord::Migration[5.2]
  def change
    create_table :breweries do |t|
      t.string :brew_id

      t.timestamps
    end
  end
end
