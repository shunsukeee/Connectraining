class SearchsController < ApplicationController
  def search
    @user_or_tweet = params[:option]
    if @user_or_tweet == "1"
      @users = User.search(params[:search], @user_or_tweet).where(withdrawal_status: false)
    else
      @tweets = Tweet.search(params[:search], @user_or_tweet).order(created_at: :desc)
    end
  end
end
