class CreateTrail < ActiveRecord::Migration[5.2]
  def change
    create_table :trails do |t|
      t.string :trail_id

      t.timestamps
    end
  end
end
