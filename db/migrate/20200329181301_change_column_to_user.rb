class ChangeColumnToUser < ActiveRecord::Migration[5.2]
  def change
    remove_index :users, :introduction
  end
end
