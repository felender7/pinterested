class ProfileController < ApplicationController

  def index
    @users = User.all

  end

  def show
    @user_pins = Pin.where("user_id = ?",params[:id])

  end
end
