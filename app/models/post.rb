class Post < ApplicationRecord

  belongs_to :user
  belongs_to :prefecture

  has_many :comments, dependent: :destroy

  has_one_attached :post_image

  validates :dog_name, presence: true
  validates :dog_type, presence: true
  validates :dog_sex, inclusion: {in: [true, false]}
                        # ↑presence: true(♂)にすると、false（♀）の時に実装されなくなる
  validates :day, presence: true
  validates :prefecture_id, presence: true
  validates :city, presence: true
  validates :post_body, presence: true, length:{maximum:200}

end
