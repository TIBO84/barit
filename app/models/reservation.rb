class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :bar
  validates :bar_id, uniqueness: { scope: :date }
  validates :user_id, :bar_id, :date, presence: true
end
