class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
		@tweets = @user.tweets.order(id: "DESC")
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		@user.update(user_params)
		redirect_to user_path(@user.id)
	end

	def hide
		@user = User.find(params[:id])
	end

	def hide_update
		@user = User.find(params[:id])
		@user.update(withdrawal_status: true)
		reset_session
		flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
		redirect_to root_path
	end

	private
	def user_params
		params.require(:user).permit(:name, :image, :introduction, :user_status)
	end
end
