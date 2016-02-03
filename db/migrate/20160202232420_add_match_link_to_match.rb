class AddMatchLinkToMatch < ActiveRecord::Migration
  def change
    add_column :matches, :match_link, :string
  end
end
