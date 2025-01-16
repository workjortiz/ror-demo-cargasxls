# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# [MODELS]
# rails g Country name:string iso_code:string region_code:integer
# rails g Brand 
# rails g UnitMeasure name:string iso_code:string
# rails g Product r


Country.destroy_all
Brand.destroy_all
UnitMeasure.destroy_all
Product.destroy_all

Country.create!([
    {name: "GUATEMALA", iso_code: "GTM", region_code: 502},
    {name: "EL SALVADOR", iso_code: "SLV", region_code: 503},
    {name: "HONDURAS", iso_code: "HND", region_code: 504},
    {name: "NICARAGUA", iso_code: "NIC", region_code: 505},
    {name: "COSTA RICA", iso_code: "CRI", region_code: 506},
    {name: "PANAMA", iso_code: "PAN", region_code: 507},
])

UnitMeasure.create!([
    {name: "CAJAS", iso_code: "CJS"},
    {name: "UNIDADES", iso_code: "UND"}
])

c1 = Country.find_by_iso_code("SLV")

Brand.create!([
    {name: "LAS PUSUSAS", code: "SC0001", country: c1}
])