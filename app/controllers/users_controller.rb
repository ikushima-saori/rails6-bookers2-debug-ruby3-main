class UsersController < ApplicationController
  before_action :ensure_correct_user, only: [:edit, :update]  #:edit, を追加

  def index   #showの下から移動
    @users = User.all
    @book = Book.new
  end  #追加

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."  #追加
      redirect_to user_path(@user)  #, notice: "You have updated user successfully."を削除、users_path
    else
      render :edit  #"show"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end
end
