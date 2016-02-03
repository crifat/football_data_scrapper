class AddEidToMatch < ActiveRecord::Migration
  def change
    add_column :matches, :eid, :string
  end
end
