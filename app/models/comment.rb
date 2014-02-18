class Comment < ActiveRecord::Base
  belongs_to :post
  validates :body, presence: true, length: { minimum: 1 }
  validates :commenter, presence: true, length: { minimum: 1 }
end
