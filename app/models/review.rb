class Review < ApplicationRecord
  belongs_to :user
  belongs_to :bar

  RATING = (0..5)
  # validates :user_id, uniqueness: { scope: :bar_id }
  validates :user_id, :bar_id, :content, :rating, presence: true
  validates :rating, inclusion: { in: RATING }
end
