class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  if Rails.env.development?
    devise :database_authenticatable, :rememberable, :trackable, :validatable
  else
    devise :database_authenticatable, :registerable, :rememberable, :trackable, :validatable
  end
end
