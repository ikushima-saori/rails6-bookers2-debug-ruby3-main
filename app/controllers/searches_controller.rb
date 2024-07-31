class SearchesController < ApplicationController
  def search
    @model = params[:model]
    @search = params[:search]
    @word = params[:word]


    if @model == "User"
      @users = User.looks(params[:search], params[:word])
    else
      @books = Book.looks(params[:search], params[:word])
    end
  end
end
