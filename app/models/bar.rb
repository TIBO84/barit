class Bar < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  has_many  :reviews, dependent: :destroy
  has_many  :reservations, dependent: :destroy
  validates :name, uniqueness: { scope: :address }
  validates :name, :capacity, :ambiance, :address, :city, presence: true

end
