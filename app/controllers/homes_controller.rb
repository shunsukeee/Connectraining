class HomesController < ApplicationController
	def home
		@users = User.order("RANDOM()").limit(4)
	end

	def torainer
		@users = User.where(user_status: 2)

	end

	def torainee
		@users = User.where(user_status: 1)
	end

	def about
		
	end
end
