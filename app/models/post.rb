class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: { minimum: 1 }
  attr_accessible :thumbnail
  has_attached_file :thumbnail
end
