class AddRouteColumnToPsas < ActiveRecord::Migration
  def self.up
    add_column :psas, :route, :string
  end

  def self.down
    remove_column :psas, :route
  end
end
