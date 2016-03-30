class PinsController < ApplicationController
  before_action :set_pins, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show] #check if the user has signed in?
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :current_user_pins, only:[:show]
  def index
    @pins = Pin.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 4)
    #<%=will_paginate @pins, renderer: BoostrapPagination::Rails%>
  end

 def create
     @pin = current_user.pins.build(pin_params)
      if @pin.save
        redirect_to @pin,notice:'Pin was sucessfully created'
      else
         render'new'
      end
 end

  def show

  end

 def edit
 end

 def update
       if @pin.update(pin_params)
          redirect_to @pin, notice:'Pin was sucessfully updated'
       else
          render 'edit'
       end
 end

  def new
    @pin = current_user.pins.build
  end


 def destroy
   @pin.destroy
    redirect_to @pin, notice:'Pin was secessfully deleted'
 end

  private
        def set_pins
            @pin = Pin.find(params[:id])
        end
        def pin_params
            params.require(:pin).permit(:description, :image)
        end
end
    def correct_user # check if the user is authorised to edit,update or destroy the pin
      @pin = current_user.pins.find_by(id: params[:id])
          redirect_t pins_path, notice: "Not authorised to edit this pin" if @pin.nil?
    end
def current_user_pins
    if user_signed_in?
     @pins = current_user.pins.order("created_at DESC")
   end
end
