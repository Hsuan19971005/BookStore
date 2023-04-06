class User < ApplicationRecord
  validates :password, presence: true, confirmation: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}\z/}
end
