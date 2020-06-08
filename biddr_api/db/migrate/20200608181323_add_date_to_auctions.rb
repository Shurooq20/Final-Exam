class AddDateToAuctions < ActiveRecord::Migration[6.0]
  def change
    add_column :auctions, :date, :date
  end
end
