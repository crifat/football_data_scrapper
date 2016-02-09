class AddMonthDayYearToMatch < ActiveRecord::Migration
  def change
    add_column :matches, :month, :string
    add_column :matches, :day, :string
    add_column :matches, :year, :string
  end
end
