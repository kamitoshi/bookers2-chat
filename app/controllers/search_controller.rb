class SearchController < ApplicationController

  def action
    @book = Book.new
    if params[:model] == "1"
      if params[:word].blank?
        redirect_to users_path
      else
        if params[:condition] == "1"
          @users = User.where('name like ?', params[:word])
        elsif params[:condition] == "2"
          @users = User.where('name like ?', "#{params[:word]}%")
        elsif params[:condition] == "3"
          @users = User.whire('name like ?', "%#{params[:word]}")
        elsif params[:condition] == "4"
          @users = User.where('name like ?', "%#{params[:word]}%")
        end
        render template: "users/index"
      end
    elsif params[:model] == "2"
      @user = current_user
      if params[:word].blank?
        redirect_to books_path
      else
        if params[:condition] == "1"
          @books = Book.where('title like ?', params[:word])
        elsif params[:condition] == "2"
          @books = Book.where('title like ?', "#{params[:word]}%")
        elsif params[:condition] == "3"
          @books = Book.whire('title like ?', "%#{params[:word]}")
        elsif params[:condition] == "4"
          @books = Book.where('title like ?', "%#{params[:word]}%")
        end
        render template: "books/index"
      end
    end
  end

end