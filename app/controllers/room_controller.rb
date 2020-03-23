class RoomController < ApplicationController
  def show
    @messages = Message.all
  end

  def index
  end
end
