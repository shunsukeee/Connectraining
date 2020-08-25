class TweetCommentsController < ApplicationController
  def create
    tweet = Tweet.find(params[:tweet_id])
    comment = current_user.tweet_comments.new(tweet_comment_params)
    comment.tweet_id = tweet.id
    if comment.save
      flash[:notice] = "コメントを送信しました。"
      redirect_back(fallback_location: root_path)
    else
      render "tweet/show"
    end
  end

  def destroy
    tweet = Tweet.find(params[:tweet_id])
    comment = TweetComment.find(params[:id])
    comment.destroy
    flash[:notice] = "コメントを削除しました。"
    redirect_back(fallback_location: root_path)
  end

  private

  def tweet_comment_params
    params.require(:tweet_comment).permit(:comment)
  end
end
