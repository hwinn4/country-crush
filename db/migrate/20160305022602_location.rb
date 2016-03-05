class Location < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.boolean :favorite, default: false
    end
  end
end
