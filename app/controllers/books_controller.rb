class BooksController < ApplicationController
  before_action :find_book_id, only: [:show, :edit, :update, :destroy, :like]
  before_action :authenticate_user!

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
    @comment = Comment.new
    # @comments = @book.comments.where(user_id: current_user.id).order(created_at: :desc)
    @comments = @book.comments.order(created_at: :desc)
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

  def like
    render json:{id: params[:id], status: "liked"}
  end

  private

  def book_param
    params.require(:book).permit(:name, :author, :price, :slug)
  end

  def find_book_id
    @book = Book.friendly.find(params[:id])
  end
end
