class BooksController < ApplicationController
before_action :is_matching_login_user, only: [:edit, :update, :destroy]  #, :destroyを追加

  def index
    @books = Book.all
    @book = Book.new  #追加
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."  #追加
      redirect_to book_path(@book)  #, notice: "You have created book successfully."を削除
    else
      @books = Book.all
      render :index  #'index'
    end
  end

  def show    #一番上から移動
    @book = Book.find(params[:id])
    @book_comment = BookComment.new
    @book_new = Book.new  #追加
    @user = @book.user  #追加

  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."  #追加
      redirect_to book_path(@book)  #, notice: "You have updated book successfully."を削除
    else
      render :edit  #"edit"
    end
  end

  def destroy   #delete
    @book = Book.find(params[:id])
    @book.destroy  #destoy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)  #, :bodyを追加
  end

  def is_matching_login_user       #追加
    @book = Book.find(params[:id])      #追加
    unless @book.user.id == current_user.id      #追加
      redirect_to books_path      #追加
    end      #追加
  end      #追加

end
