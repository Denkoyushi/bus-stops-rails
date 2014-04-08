class Bus < ActiveRecord::Base
  belongs_to :line
  has_many :arrivals
end
