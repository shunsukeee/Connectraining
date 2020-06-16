class Tweet < ApplicationRecord

	belongs_to :user
	attachment :tweet_image
	has_many :tweet_comments, dependent: :destroy
	has_many :favorites, dependent: :destroy
	def favorited_by?(user)
        	favorites.where(user_id: user.id).exists?
    end

    def Tweet.search(search, user_or_tweet)
    	if user_or_tweet == "2"
            Tweet.where(['body LIKE ?', "%#{search}%"])
    	else
    		Tweet.all
    	end
    end
end
