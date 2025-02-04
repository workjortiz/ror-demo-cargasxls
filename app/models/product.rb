class Product < ApplicationRecord
  belongs_to :brand
  belongs_to :unit_measure

  def eval_exist
    exist_product = Product.where(description: self.description, brand: self.brand, unit_measure: self.unit_measure).first
    exist_product.present?
  end

  def self.generate_long_code(brand, um)
    val = Product.where(brand: brand).count
    "" + brand.country.iso_code + brand.code + (100000+val.to_i).to_s + um.iso_code[0]
  end

end
