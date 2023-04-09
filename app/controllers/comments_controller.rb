class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_book, only: [:create]
  def create
    @comment = Comment.new(comment_params)
    @comment.book_id = @book.id
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to book_path(@book.id), notice: "New comment!"
    else
      @comments = @book.comments.where(user_id: current_user.id).order(created_at: :desc)
      render 'books/show'
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end

  def find_book
    @book = Book.find(params[:book_id])
  end
end
