class Tweet < ApplicationRecord

	belongs_to :user
	attachment :tweet_image
	has_many :tweet_comments, dependent: :destroy
end
