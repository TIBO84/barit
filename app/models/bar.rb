class Bar < ApplicationRecord
  def full_address
    [address, city.capitalize, 'France'].compact.join(', ')
  end

  def rating
    ratings = []
    if reviews.any?
      reviews.each do |review|
        ratings << review.rating
      end
    end
    if ratings != []
      average = ratings.sum / ratings.size.to_f
      return average.round(1)
    else
      return 0
    end
  end
  geocoded_by :full_address
  after_validation :geocode, if: :will_save_change_to_address?

  has_one_attached :photo
  belongs_to :owner, class_name: 'User'
  has_many  :reviews, dependent: :destroy
  has_many  :reservations, dependent: :destroy
  validates :name, uniqueness: { scope: :address }
  validates :name, :capacity, :ambiance, :address, :city, presence: true
end
