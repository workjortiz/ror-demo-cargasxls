class Brand < ApplicationRecord
  belongs_to :country
  has_many :products
end
