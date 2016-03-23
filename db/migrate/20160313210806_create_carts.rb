class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
    	t.belongs_to :visit, index: true
    	t.belongs_to :item, index: true
    end
  end
end
