class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.boolean :open
      t.text :notes
      t.references :owner
      t.timestamps null: false
    end
  end
end
