class Book < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  acts_as_paranoid

  validates :name, presence: true

  has_many :comments

  has_many :favorite_books
  has_many :users, through: :favorite_books

  # scope :lower_price_books, ->(x){where("price < #{x}")}
  # def self.lower_price_books(x)
  #   where("price < #{x}")
  # end
end
