class Product < ApplicationRecord
  belongs_to :brand
  belongs_to :unit_measure
  validates :long_code, presence: {message: "can't generate value"}
  validates :description, length: { minimum: 10, maximum: 120, message: "must be between 10 and 120 characters long" }
  
  def eval_exist
    exist_product = Product.where(description: self.description, brand: self.brand, unit_measure: self.unit_measure).first
    exist_product.present?
  end

  def self.generate_long_code(brand, um)
    val = Product.where(brand: brand).count
    if brand.present? && um.present?
      "" + brand.country.iso_code + brand.code + (100000+val.to_i).to_s + um.iso_code[0]
    else
      nil
    end
  end

end
