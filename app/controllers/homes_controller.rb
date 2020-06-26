class HomesController < ApplicationController
	def home
		@users_recommend = User.where(recommend_status: 1)
	end

	def torainer
		@users = User.page(params[:page]).reverse_order.per(8).where(user_status: 2, withdrawal_status: false)
		@admin_users = User.page(params[:page]).reverse_order.per(8).where(user_status: 2)

	end

	def torainee
		@users = User.page(params[:page]).reverse_order.per(8).where(user_status: 1, withdrawal_status: false)
		@admin_users = User.page(params[:page]).reverse_order.per(8).where(user_status: 1)
	end

	def about
		
	end
end
