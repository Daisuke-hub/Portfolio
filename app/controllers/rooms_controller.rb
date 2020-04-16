class RoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :baria_room, only: [:show]

  def create
    check_host = Room.where(host_id: current_user.id, member_id: params[:user_id]).exists?
    check_member = Room.where(host_id: params[:user_id], member_id: current_user.id).exists?
    if check_host || check_member == true
      if Room.where(host_id: current_user.id, member_id: params[:user_id]).exists? == false
        room = Room.where(host_id: params[:user_id], member_id: current_user.id).first
      else
        room = Room.where(host_id: current_user.id, member_id: params[:user_id]).first
      end
    else
      room = Room.new(host_id: current_user.id, member_id: params[:user_id])
      room.save
    end
    redirect_to room_path(room)
  end

  def show
    @room = Room.find(params[:id])
    @messages = @room.messages.with_deleted
    if @room.host_id == current_user.id
      @receive_user_id = @room.member_id
    else
      @receive_user_id = @room.host_id
    end
    @receive_user = User.with_deleted.where(id: @receive_user_id).first
  end

  def index
    user_messages = Message.with_deleted.where("(user_id = ?) OR (receiver_id = ?)", current_user, current_user)
    @user_messages = user_messages.order(created_at: :desc)
    @new_message = @user_messages.first
  end

  private

  def baria_room
    user_rooms = Room.where("(host_id = ?) OR (member_id = ?)", current_user,current_user)
    if user_rooms.where(id: params[:id]).empty?
      redirect_to user_path(current_user)
    end
  end

end