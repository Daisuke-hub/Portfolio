class UsersController < ApplicationController
  def index
    @q = User.ransack(params[:q])
    @users_all = @q.result(distinct: true)
    @users = @users_all.page(params[:page]).per(7)
    rooms = Room.where("(host_id = ?) OR (member_id = ?", current_user,current_user)
    @rooms = rooms.page(params[:page]).per(4)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = current_user
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    # genre = Genre.find(genre_params)
    # user.update(user_id: current_user.id, genre_id: genre.id)
    redirect_to user_path(current_user)
  end

  private
  def user_params
    params.require(:user).permit(:name, :sex, :age, :instrument, :level, :region, :introduction, :chat_flag, :email, :user_image)
  end

  def genre_params
    params.require(:genre).permit(:genre_name)
  end
end
