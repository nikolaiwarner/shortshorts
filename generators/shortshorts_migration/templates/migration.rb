class ShortshortsMigration < ActiveRecord::Migration
  def self.up
    create_table "shortshorts_urls", :force => true do |t|
      t.string :url
      t.string :short_model
      t.integer :short_id
    
      t.timestamps
    end    
  end

  def self.down
    drop_table "shortshorts_urls"
  end
end
