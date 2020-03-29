class ChangeColumnToUser < ActiveRecord::Migration[5.2]
  def up
    change_column :users, :introduction, :string, index: true
  end

  def down
    change_column :users, :introduction, :text, index: true
  end
end
