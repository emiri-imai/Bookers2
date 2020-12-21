class UsersController < ApplicationController

before_action :authenticate_user!

def ensure_current_user
  if current_user.id != params[:id].to_i
    redirect_to user_path(user.id)
  end
end

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

  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def index
    @users = User.all
    @user = User.find(current_user.id)
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render :edit
    else
      redirect_to user_path(current_user.id)
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

end



  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end





