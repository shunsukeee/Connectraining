class UsersController < ApplicationController
	
	def index
		@users = User.page(params[:page]).reverse_order.per(8)
	end

	def show
		@user = User.find(params[:id])
		@tweets = @user.tweets.order(id: "DESC")
		if	user_signed_in?
			@currentUserEntry=Entry.where(user_id: current_user.id)
	    	@userEntry=Entry.where(user_id: @user.id)
	    	unless @user.id == current_user.id
	      		@currentUserEntry.each do |cu|
	        	@userEntry.each do |u|
	          		if cu.room_id == u.room_id then
	       	 			@isRoom = true
	            		@roomId = cu.room_id
	          		end
	  	  		end
	      	end
	      if @isRoom
	      else
	        @room = Room.new
	        @entry = Entry.new
	      end
	    end
    end
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

	def follows
    	user = User.find(params[:id])
    	@users = user.followings
  	end

  	def followers
    	user = User.find(params[:id])
    	@users = user.followers
  	end

	private
	def user_params
		params.require(:user).permit(:name, :image, :introduction, :user_status, :recommend_status)
	end
end
