class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author

  validates :body, :author_id, presence: true
end
