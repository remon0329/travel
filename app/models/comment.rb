class Comment < ApplicationRecord
  belongs_to :park
  validates :content, presence: true
end
