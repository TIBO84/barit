class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :bar
  validates :date, uniqueness: { scope: :bar_id, message: "not available my friend !" }
  validates :user_id, :bar_id, :date, presence: true
end
