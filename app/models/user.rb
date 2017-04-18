class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # Good job bringing in Devise for your user model
has_many :books
has_many :reviews


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
