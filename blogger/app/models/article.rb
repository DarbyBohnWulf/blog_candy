class Article < ApplicationRecord
  has_many :comments
  validates :title, :body, presence: true
  validates :title, length: { minimum: 8 }
end
