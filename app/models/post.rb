class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: { minimum: 1 }
  validates :thumbnail, presence: true
  has_attached_file :thumbnail, :styles => { 
    :thumb => "200x200#"
  }
  self.per_page = 6
end
