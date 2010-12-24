class AddUserAgentToPsas < ActiveRecord::Migration
  def self.up
    add_column :psas, :user_agent, :string
  end

  def self.down
    remove_column :psas, :user_agent
  end
end
