class CreateItemsVisits < ActiveRecord::Migration
  def change
    create_table :items_visits do |t|
    	t.belongs_to :visit, index: true
    	t.belongs_to :item, index: true
    end
  end
end
