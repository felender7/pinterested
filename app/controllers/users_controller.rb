class UsersController < ApplicationController
  def index
    @users = User.all
  end
end
def show
    @user_pins = Pin.where(user_id(params[:id]))
end
