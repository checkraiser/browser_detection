class AddOsToUser < ActiveRecord::Migration
  def change
    add_column :users, :os, :text
  end
end
