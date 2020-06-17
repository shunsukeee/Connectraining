class TweetsController < ApplicationController

	def new
		@tweet = Tweet.new
	end

	def index
		@user = User.find(current_user.id)
		@users = @user.followings
		@tweets = []
		@users.each do |user|
			tweets = Tweet.where(user_id: user.id).order(created_at: :desc)
			@tweets.concat(tweets)
		end
		@tweets.concat(current_user.tweets)
		@tweets.sort_by!{|tweet| tweet.created_at}.reverse!

	end

	def show
		@tweet = Tweet.find(params[:id])
		@tweet_comment = TweetComment.new
    	@tweet_comments = TweetComment.all
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

	def destroy
		@tweet = Tweet.find(params[:id])
		@tweet.destroy
		redirect_to user_path(current_user)
	end

	private
	def tweet_params
		params.require(:tweet).permit(:body, :tweet_image)
	end
end
