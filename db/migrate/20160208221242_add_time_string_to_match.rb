class AddTimeStringToMatch < ActiveRecord::Migration
  def change
    add_column :matches, :time_string, :string
  end
end
