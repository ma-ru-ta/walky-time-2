class Post < ApplicationRecord
  has_many :commets, dependent: :destroy
  
  belongs_to :prefecture

  has_one_attached :post_image

  validates :dog_name, presence: true
  validates :dog_type, presence: true
  validates :dog_sex, presence: true
  validates :day, presence: true
  validates :prefecture_id, presence: true
  validates :city, presence: true
  validates :post_body, presence: true, length:{maximum:200}

end
