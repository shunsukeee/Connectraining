class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  # =============デバイス==========================
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # ==============================================

  # ==========バリデーション=================
  validates :name, presence: true
  validates :user_status, presence: true
  validates :introduction, length: { maximum: 100 }
  #  ======================================

  attachment :image
  has_many :tweets, dependent: :destroy
  has_many :tweet_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy

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

  # =====検索=====================================
  def User.search(search, user_or_tweet)
      if user_or_tweet == "1"
        User.where(['name LIKE ?', "%#{search}%"])
      else
        User.all
      end
  end
  # ==============================================
end
