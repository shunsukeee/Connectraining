class TweetsController < ApplicationController

	def new
		if user_signed_in?
			@tweet = Tweet.new
		else
			redirect_to root_path
		end
	end

	def index
		if user_signed_in?
			@user = User.find(current_user.id)
			@users = @user.followings
			@tweets = []
			@users.each do |user|
				tweets = Tweet.where(user_id: user.id).order(created_at: :desc)
				@tweets.concat(tweets)
			end
			@tweets.concat(current_user.tweets)
			@tweets.sort_by!{|tweet| tweet.created_at}.reverse!
		else
			redirect_to root_path
		end
	end

	def show
		@tweet = Tweet.find(params[:id])
		@user = @tweet.user
		@tweet_comment = TweetComment.new
	    @tweet_comments = TweetComment.all
	end

	def create
		@tweet = Tweet.new(tweet_params)
		@tweet.user_id = current_user.id
		if @tweet.save
			flash[:notice] = "ツイートを送信しました。"
			redirect_to user_path(current_user)
		else
			render :new
		end
	end

	def edit
		@tweet = Tweet.find(params[:id])
		if admin_signed_in?
		elsif current_user.id == @tweet.user_id
		else
			redirect_to tweets_path
		end
	end

	def update
		@tweet = Tweet.find(params[:id])
		if @tweet.update(tweet_params)
			flash[:notice] = "ツイートを編集しました。"
			redirect_to user_path(current_user)
		else
			render :edit
		end
	end

	def destroy
		@tweet = Tweet.find(params[:id])
		@tweet.destroy
		flash[:notice] = "ツイートを削除しました。"
		if admin_signed_in?
			redirect_to admins_users_path
		else
			redirect_to user_path(current_user)
		end

	end

	private
	def tweet_params
		params.require(:tweet).permit(:body, :tweet_image)
	end
end
