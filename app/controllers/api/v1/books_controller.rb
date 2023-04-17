# module Api
#   module V1
#     class BooksController < ApplicationController
#       before_action :find_book_id, only: [:like]
#       before_action :authenticate_user!
      
#       def like
#         p "-"*20
#         p "LIKE!!!!!"
#         p "-"*20
#         liked = current_user.like?(@book)
#         if liked
#           current_user.liked_books.destroy(@book)
#           render json:{id: params[:id], status: "dislike"}
#         else
#           current_user.liked_books << @book
#           render json:{id: params[:id], status: "like"}
#         end
#       end

#       private

#       def book_param
#         params.require(:book).permit(:name, :author, :price, :slug)
#       end

#       def find_book_id
#         @book = Book.friendly.find(params[:id])
#       end
#     end
#   end
# end