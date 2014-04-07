class Station < ActiveRecord::Base
  has_many :stops
  has_many :lines, through: :stops
  validates :name, presence: true, uniqueness: true

  # before_save :slugify

  # private
  #   def slugify
  #     self.slug = self.name.parameterize
  #   end
end
