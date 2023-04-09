class Comment < ApplicationRecord
  acts_as_paranoid
  validates :content, presence: true
  belongs_to :user
  belongs_to :book
end
