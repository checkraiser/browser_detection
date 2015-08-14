class AddIpToUser < ActiveRecord::Migration
  def change
    add_column :users, :ip, :text
  end
end
