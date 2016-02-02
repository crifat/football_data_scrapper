class CreateAssists < ActiveRecord::Migration
  def change
    create_table :assists do |t|
      t.integer :match_id
      t.integer :player_id
      t.string :player_name

      t.timestamps null: false
    end
  end
end
