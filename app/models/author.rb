class Author < ApplicationRecord
  has_many :comments

  validates :first_name, :last_name, presence: true
end
