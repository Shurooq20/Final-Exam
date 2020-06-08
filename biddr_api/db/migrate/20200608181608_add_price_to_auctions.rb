class AddPriceToAuctions < ActiveRecord::Migration[6.0]
  def change
    add_column :auctions, :price, :integer
  end
end
