class CreateGenreRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :genre_relationships do |t|
      t.integer :user_id, null: false
      t.integer :genre_id, null: false

      t.timestamps
    end
  end
end
