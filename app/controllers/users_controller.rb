class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome! You have signed up successfully."
      redirect_to user_path(@user.id)
    else
      render :new
    end
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if
    @book.save
    redirect_to book_path(@book.id)
    else
    render :show
    end
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = @user.books
  end

  def index
    @users = User.all
    @user = User.find(current_user.id)
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render :edit
    else
      redirect_to users_path
    end
  end

  def update
    @user = User.find(params[:id])
    if
    @user.update(user_params)
    flash[:notice] = 'You have updated user successfully.'
    redirect_to user_path(@user.id)
    else
    render :edit
    end
  end



  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
