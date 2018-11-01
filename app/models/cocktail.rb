class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  validates_associated :doses, :ingredients
  validates :name, uniqueness: true, presence: true
end
