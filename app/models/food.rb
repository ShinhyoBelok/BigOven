class Food < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods

  validates :name, :measurement_unit, presence: true
  validates :price, :quantity, numericality: { only_integer: false }, presence: true
end
