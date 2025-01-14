class Product < ApplicationRecord
  belongs_to :brand
  belongs_to :unit_measure
end
