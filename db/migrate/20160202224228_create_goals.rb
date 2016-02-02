class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.integer :player_id
      t.string :player_name
      t.integer :assist_id
      t.integer :match_id

      t.timestamps null: false
    end
  end
end
