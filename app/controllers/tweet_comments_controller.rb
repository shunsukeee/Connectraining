class TweetCommentsController < ApplicationController

	def create
		tweet = Tweet.find(params[:tweet_id])
		comment = current_user.tweet_comments.new(tweet_comment_params)
		comment.tweet_id = tweet.id
		comment.save
		redirect_back(fallback_location: root_path)
	end

	def destroy
		tweet = Tweet.find(params[:tweet_id])
		comment = current_user.tweet_comments.find(params[:id])
		comment.destroy
		redirect_back(fallback_location: root_path)
	end

	private
	def tweet_comment_params
		params.require(:tweet_comment).permit(:comment)
	end
end
