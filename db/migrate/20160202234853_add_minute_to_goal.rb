class AddMinuteToGoal < ActiveRecord::Migration
  def change
    add_column :goals, :minute, :integer
  end
end
