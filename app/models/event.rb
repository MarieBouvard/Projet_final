class Event < ApplicationRecord
    validates :start_date, presence: true
  validates :duration, presence: true, if: :valid_duration_multiple_of_5
  validates :title, presence: true, length: { in: 5..140 }
  validates :description, presence: true, length: { in: 20..1000 }
  validates :price, presence: true, inclusion: 1..1000
  validates :location, presence: true

  has_many :attendances
  has_many :users, through: :attendances

  has_many :participants, class_name: 'User'
  belongs_to :admin, class_name: 'User'

  private

  def valid_duration_multiple_of_5
    error.add(:duration, 'La Durée est défini par tranche de 5 minutes') if duration && duration % 5 != 0
  end
end
