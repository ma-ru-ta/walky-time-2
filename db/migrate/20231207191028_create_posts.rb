class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :user_id, null: false
      t.string :dog_name, null: false
      t.string :dog_type, null: false
      t.boolean :dog_sex, null: false, default: true
      t.date :day, null: false
      t.integer :prefecture_id, null: false
      t.string :city, null: false
      t.string :post_body, null: false
      t.integer :hold_user_id
      t.boolean :active_status, null: false, default: true

      t.timestamps
    end
  end
end
