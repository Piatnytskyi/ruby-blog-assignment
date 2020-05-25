class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :thumbnail
  has_one_attached :background
  has_many :comments, dependent: :destroy

  has_rich_text :body

  validates :title, length: { minimum: 5 }
  validates :body,  length: { minimum: 30 }
  
  extend FriendlyId
  friendly_id :title, use: :slugged

  self.per_page = 10
end
