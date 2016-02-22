class PinsController < ApplicationController
  before_action :set_pins, only: [:show, :edit, :update, :destroy]
  def index
    @pins = Pin.all.order("created_at DESC")
  end

 def create
   @pin = Pin.new(pin_params)
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
    @pin = Pin.new
  end


 def destroy
   @pin.destroy
    redirect_to @pin, notice:'Pin was secessfully deleted'
 end
end
private
    def set_pins
        @pin = Pin.find(params[:id])
    end
    def pin_params
        params.require(:pin).permit(:description)
    end
