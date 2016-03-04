class CreateTwitterConnections < ActiveRecord::Migration
  def change
    create_table :twitter_connections do |t|

      t.timestamps null: false
    end
  end
end
