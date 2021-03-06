class User < ApplicationRecord
  has_many  :bars, foreign_key: :owner_id
  has_many  :reservations
  has_many  :reviews
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
