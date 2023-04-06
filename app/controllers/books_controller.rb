class BooksController < ApplicationController
  before_action :find_book_id, only: [:show, :edit, :update, :destroy]
  def index
    @books = Book.all
    if params[:keyword].present?
      @books = Book.where("name LIKE ? or author LIKE ?", "%#{params[:keyword]}%", "%#{params[:keyword]}%")
    end
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_param)
    if @book.save
      redirect_to books_path, notice: "Add new book successfully"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @book.update(book_param)
      redirect_to books_path, notice: "Edit book successfully"
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    redirect_to books_path, notice: "Delet book successfully"
  end

  private
  def book_param
    params.require(:book).permit(:name, :author, :price)
  end

  def find_book_id
    @book = Book.find_by!(id: params[:id])
  end
end
