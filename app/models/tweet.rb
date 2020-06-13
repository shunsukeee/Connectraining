class Tweet < ApplicationRecord

	belongs_to :user
	attachment :tweet_image
end
