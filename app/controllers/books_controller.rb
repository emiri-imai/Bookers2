class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    book = Book.new(book_paramas)
    book.save
    redirect_to book_path(book.id)
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end


end
