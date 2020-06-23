class HomesController < ApplicationController
	def home
		@users_torainer = User.order("RANDOM()").limit(6).where(user_status: 2)
		@users_torainee = User.order("RANDOM()").limit(6).where(user_status: 1)
	end

	def torainer
		@users = User.page(params[:page]).reverse_order.per(8).where(user_status: 2)

	end

	def torainee
		@users = User.page(params[:page]).reverse_order.per(8).where(user_status: 1)
	end

	def about
		
	end
end
