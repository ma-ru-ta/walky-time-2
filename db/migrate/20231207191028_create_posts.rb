class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :dog_name, null: false
      t.date :day, null: false
      t.string :city, null: false
      t.string :post_body, null: false
      t.boolean :is_post_status, null: false, default: true

      t.timestamps
    end
  end
end
