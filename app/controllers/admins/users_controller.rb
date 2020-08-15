class Admins::UsersController < ApplicationController
  def index
    @admin_users = User.page(params[:page]).reverse_order.per(8)
  end
end
