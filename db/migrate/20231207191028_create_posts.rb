class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :dog_name
      t.date :day
      t.string :city
      t.text :post_body
      t.boolean :is_post_status

      t.timestamps
    end
  end
end
