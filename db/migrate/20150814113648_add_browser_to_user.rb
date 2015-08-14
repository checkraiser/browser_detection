class AddBrowserToUser < ActiveRecord::Migration
  def change
    add_column :users, :browser, :text
  end
end
