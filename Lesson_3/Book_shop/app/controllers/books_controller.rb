class BooksController < ApplicationController
  before_action :current_book, only: [:show, :edit, :update, :destroy]

  def index
  	@books = Book.all
  end

  def show
  end

  def new
  	@book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
    	redirect_to @book
    else	
    	render :new
    end	
  end	

  def edit
  end

  def update
    @book.update_attributes(book_params)
    if @book.errors.empty?
    	redirect_to @book
    else
      render :edit
    end  	
  end	

  def destroy
    @book.delete
    redirect_to books_path
  end	

  private

  def book_params
    params.require(:book).permit(:name, :price)
  end	

  def current_book
    @book = Book.where(id: params[:id]).first
  end	
end