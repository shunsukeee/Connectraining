class TweetsController < ApplicationController

	def new
		@tweet = Tweet.new
	end

	def show
		
	end

	def create
		@tweet = Tweet.new(tweet_params)
		@tweet.user_id = current_user.id
		@tweet.save
		redirect_to user_path(current_user)
	end

	def edit
		@tweet = Tweet.find(params[:id])
	end

	def update
		@tweet = Tweet.find(params[:id])
		@tweet.update(tweet_params)
		redirect_to user_path(current_user)
	end

	private
	def tweet_params
		params.require(:tweet).permit(:body, :tweet_image)
	end
end
