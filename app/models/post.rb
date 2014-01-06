class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: { minimum: 1 }
  has_attached_file :thumbnail, :styles => { 
    :thumb => "200x200#"
  }
end
