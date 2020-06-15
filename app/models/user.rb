class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :image

  has_many :tweets, dependent: :destroy

  # ====================自分がフォローしているユーザーとの関連 ===================================
  has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
  has_many :followings, through: :active_relationships, source: :follower
  # ========================================================================================

  # ====================自分がフォローされるユーザーとの関連 ===================================
  has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
  has_many :followers, through: :passive_relationships, source: :following
  # =======================================================================================

  def followed_by?(user)
    passive_relationships.find_by(following_id: user.id).present?
  end
  
  # ====退会ユーザーがログインできないように====
  def active_for_authentication?
    super && (self.withdrawal_status == false)
  end
  # =======================================
end
