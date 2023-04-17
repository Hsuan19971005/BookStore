class User < ApplicationRecord
  validates :password, presence: true, confirmation: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}\z/}
  has_many :comments

  has_many :favorite_books
  has_many :liked_books, through: :favorite_books, source: :book
  
  def self.login(email:, password:)
    find_by(email: email, password: password)
  end

  def like?(book)
    liked_books.include?(book)
  end
end
