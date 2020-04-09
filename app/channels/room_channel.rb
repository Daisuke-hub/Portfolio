class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    message = Message.new(content: data["message"], user_id: current_user.id, room_id: data["room_id"], receiver_id: data["receive_user_id"])
    message.save
    user_image = Refile.attachment_url(current_user, :user_image)
    created_time = message.created_at.strftime('%m/%d %H:%M')
    ActionCable.server.broadcast "room_channel", user_id: current_user.id, content: data["message"], message_id: message.id ,user_image: user_image, created_time: created_time, receive_user_id: data["receive_user_id"]
  end
end
