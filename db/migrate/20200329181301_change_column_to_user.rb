class ChangeColumnToUser < ActiveRecord::Migration[5.2]
  def up
    change_column :users, :introduction, :text, index: true, limit: 255
  end

  def down
    change_column :users, :introduction, :text, index: true
  end
end
