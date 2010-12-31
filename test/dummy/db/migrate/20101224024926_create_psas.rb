class CreatePsas < ActiveRecord::Migration
  def self.up
    create_table :psas do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.integer :max_views
      t.string :route
      t.string :user_agent
      t.text :message

      t.timestamps
    end
  end

  def self.down
    drop_table :psas
  end
end
