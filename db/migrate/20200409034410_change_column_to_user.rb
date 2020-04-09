class ChangeColumnToUser < ActiveRecord::Migration[5.2]
  def up
    change_column :users, :age, :integer, index: true
  end

  # 変更前の状態
  def down
    change_column :users, :age, :string, index: true
  end
end