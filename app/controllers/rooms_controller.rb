class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def create 
    @room = Room.new
    @room.save
    UserRoom.create!(user_id: current_user.id, room_id: @room.id)
    UserRoom.create!(user_id: params[:user_id], room_id: @room.id)
    redirect_to room_url(@room)
  end

  def show
    @room = Room.find(params[:id])
    @chats = @room.chats.recent.limit(10).reverse
  end
end
