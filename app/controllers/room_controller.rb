class RoomController < ApplicationController
  def index
    @messages = Message.all
  end
end
