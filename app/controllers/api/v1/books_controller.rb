class Api::V1::BooksController < ApplicationController
  before_action :set_book, only: [:show, :update, :destroy]

  def index
    @books = Book.all
    render json: @books
  end

  def show
    render json: @book
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      render json: @book, status: :created
    else
      render json: @book, status: :unprocessable_entity
    end
  end

  def update
    if @book.update(book_params)
      render json: :@book, status: :ok
    else
      render json: @actor.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @book.destroy
    head :not_content
  end

  private

  def set_book
    @book = Book.find_by(id: params[:id])
    unless @book
      render json: {error: 'book not found'}, status: :not_found
    end
  end

  def book_params
    params.require(:book).permit(:title, :name)
  end
end
