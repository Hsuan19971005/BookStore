class Book < ApplicationRecord
  validates :name, presence: true

  # scope :lower_price_books, ->(x){where("price < #{x}")}
  # def self.lower_price_books(x)
  #   where("price < #{x}")
  # end
end
