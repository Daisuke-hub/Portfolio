class CreatePrefectures < ActiveRecord::Migration[5.2]
  def change
    create_table :prefectures do |t|
      t.string :prefecture_name, null: false, index: true
      t.integer :region_id, null: false, index: true

      t.timestamps
    end
  end
end
