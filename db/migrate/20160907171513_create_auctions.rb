class CreateAuctions < ActiveRecord::Migration
  def change
    create_table :auctions do |t|
      t.string :item_name
      t.string :condition
      t.string :starts
      t.string :ends
      t.string :description

      t.timestamps null:false
    end
  end
end
