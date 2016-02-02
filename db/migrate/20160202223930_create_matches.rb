class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.date :date
      t.string :name

      t.timestamps null: false
    end
  end
end
