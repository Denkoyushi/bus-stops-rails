class Arrival < ActiveRecord::Base
  validates :time, :presence => true
  belongs_to :bus
  belongs_to :stop
end
