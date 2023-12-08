class Post < ApplicationRecord
  
  has_one_attached :post_image

  belongs_to :genre
  
  
  validates :dog_name, presence: true
  validates :day, presence: true
  validates :city, presence: true
  validates :post_body, presence: true, length:{maximum:200}
  
end
