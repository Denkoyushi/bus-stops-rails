class Line < ActiveRecord::Base
  validates :number, presence: true, uniqueness: true
  has_many :stops
  has_many :stations, through: :stops
  has_many :buses
  has_many :arrivals, through: :buses
end
