class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
  end

  def unsubscribed

    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    chat = Chat.create!(content: data['chat'],user_id: current_user.id,room_id: params["room_id"])
    render_chat = ApplicationController.renderer.render(partial: 'chats/chat',locals: {chat: chat})
    ActionCable.server.broadcast 'room_channel',chat: render_chat,room_id: params["room_id"]
  end
end
