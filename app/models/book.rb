class Book < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  acts_as_paranoid

  validates :name, presence: true

  has_many :comments

  # scope :lower_price_books, ->(x){where("price < #{x}")}
  # def self.lower_price_books(x)
  #   where("price < #{x}")
  # end
end
