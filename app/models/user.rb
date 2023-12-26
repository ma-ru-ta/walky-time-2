class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  GUEST_USER_EMAIL = "guest@example.com"
  # 定数にメアド入れてあげる

  def guest?
    email == GUEST_USER_EMAIL
  end

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_posts, through: :favorites, source: :post
    # Userがお気に入りした（_）投稿の一覧がみれる
  has_many :posts, :dependent => :destroy
  # 退会ユーザーに紐づくお気に入りも削除する場合
  has_many :favorites, :dependent => :destroy
  # 退会ユーザーに紐づくコメントも削除する場合
  has_many :comments, :dependent => :destroy


  validates :user_name, length: { minimum: 2 , maximum: 20 }
  validates :real_name, presence: true
  validates :address, presence: true
  validates :postal_code, presence: true
  validates :telephone_number, presence: true

  def self.guest
    find_or_create_by!(email: GUEST_USER_EMAIL) do |user|
      user.password = SecureRandom.urlsafe_base64
      user.user_name = "ゲスト君"
      user.real_name = "げすとたろう"
      user.postal_code = "1111111"
      user.address = "hawaii"
      user.telephone_number = "11111111111"
      user.is_active = false
    end
  end

  def self.search_for(content)
    where("user_name LIKE ?", "%#{content}%")
  end
  # ↑部分一致の検索結果が表示されるようになる。

end
