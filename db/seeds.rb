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
# rails g scaffold Country name:string iso_code:string region_code:integer
# rails g scaffold Brand name:string code:string country:references
# rails g scaffoldUnitMeasure name:string iso_code:string
# rails g scaffold Product short_code:integer long_code:string description:string base64_code:string brand:references unit_measure:references
# rails g scaffold Taxrule name:string code:string value_rule:integer
# rails g scaffold Currency name:string iso_code:string country:references short_code:string
# rails g scaffold Client fiscal_name:string comercial_name:string fiscal_address:string comercial_address:string base64_code:string country:references taxrule:references currency:references

# SOURCE
# ISO COUNTRIES: https://www.iban.com/country-codes
# DIAL REGION CODE: https://countrycode.org/

# TERMINAL COMMAND
# rake db:seed

Product.destroy_all
Brand.destroy_all
Country.destroy_all
UnitMeasure.destroy_all
BitLoadData.destroy_all

Country.create([
    {name: "MEXICO", iso_code: "MEX", region_code: 52},
    {name: "GUATEMALA", iso_code: "GTM", region_code: 502},
    {name: "EL SALVADOR", iso_code: "SLV", region_code: 503},
    {name: "HONDURAS", iso_code: "HND", region_code: 504},
    {name: "NICARAGUA", iso_code: "NIC", region_code: 505},
    {name: "COSTA RICA", iso_code: "CRI", region_code: 506},
    {name: "PANAMA", iso_code: "PAN", region_code: 507},
])

UnitMeasure.create([
    {name: "CAJAS", iso_code: "CJS"},
    {name: "UNIDADES", iso_code: "UND"}
])


um_und = UnitMeasure.find_by_iso_code("UND")
um_cjs = UnitMeasure.find_by_iso_code("CJS")

c_slv = Country.find_by_iso_code("SLV")
c_mex = Country.find_by_iso_code("MEX")
c_gtm = Country.find_by_iso_code("GTM")

Brand.create([
    {name: "LAS PUSUSAS", code: "SC01", country: c_slv},
    {name: "TIPICOS", code: "SR02", country: c_slv},
    {name: "POLLERIA", code: "MR01", country: c_mex},
    {name: "PICANTE, S.A.", code: "MC01", country: c_mex},
    {name: "HARINA Y MASAPAN", code: "MC02", country: c_mex},
    {name: "TEXMEX", code: "MC0003", country: c_mex},
    {name: "CENTRO COMESTIBLE", code: "GD01", country: c_gtm},
])

b_001 = Brand.find_by_code("SC01")
b_002 = Brand.find_by_code("SR02")
b_003 = Brand.find_by_code("MR01")
b_004 = Brand.find_by_code("MC01")
b_005 = Brand.find_by_code("MC02")
b_006 = Brand.find_by_code("GD01")

Product.create({
    short_code: (Param.generate_nn("NN_PRODUCTS")), 
    long_code: (Product.generate_long_code(b_006,um_und)),
    description: "ENLATADO ELOTITOS 8onz",
    base64_code: SecureRandom.base64(10),
    brand: b_006,
    unit_measure: um_und
})
Product.create({
    short_code: (Param.generate_nn("NN_PRODUCTS")), 
    long_code: (Product.generate_long_code(b_006,um_und)),
    description: "ENLATADO MIX VERDURA 8onz",
    base64_code: SecureRandom.base64(10),
    brand: b_006,
    unit_measure: um_und
})
Product.create({
    short_code: (Param.generate_nn("NN_PRODUCTS")), 
    long_code: (Product.generate_long_code(b_006,um_und)),
    description: "ENLATADO ZANAHORITA CUBITOS 8onz",
    base64_code: SecureRandom.base64(10),
    brand: b_006,
    unit_measure: um_und
})
Product.create({
    short_code: (Param.generate_nn("NN_PRODUCTS")), 
    long_code: (Product.generate_long_code(b_002,um_und)),
    description: "BOLSA ENSALADA REPOLLO 12onz",
    base64_code: SecureRandom.base64(10),
    brand: b_002,
    unit_measure: um_und
})
Product.create({
    short_code: (Param.generate_nn("NN_PRODUCTS")), 
    long_code: (Product.generate_long_code(b_002,um_und)),
    description: "BOLSA JULIANAS ZANAHORIA 12onz",
    base64_code: SecureRandom.base64(10),
    brand: b_002,
    unit_measure: um_und
})
Product.create({
    short_code: (Param.generate_nn("NN_PRODUCTS")), 
    long_code: (Product.generate_long_code(b_002,um_und)),
    description: "BOLSA AJOS PELADOS 3onz",
    base64_code: SecureRandom.base64(10),
    brand: b_002,
    unit_measure: um_und
})
Product.create({
    short_code: (Param.generate_nn("NN_PRODUCTS")), 
    long_code: (Product.generate_long_code(b_002,um_und)),
    description: "BANDEJA BROCOLI CORTADO 10onz",
    base64_code: SecureRandom.base64(10),
    brand: b_002,
    unit_measure: um_und
})
Product.create({
    short_code: (Param.generate_nn("NN_PRODUCTS")), 
    long_code: (Product.generate_long_code(b_004,um_und)),
    description: "BOTELLA PICANTE SALSA ROJA 200ML",
    base64_code: SecureRandom.base64(10),
    brand: b_004,
    unit_measure: um_und
})
Product.create({
    short_code: (Param.generate_nn("NN_PRODUCTS")), 
    long_code: (Product.generate_long_code(b_004,um_cjs)),
    description: "BOTELLA PICANTE SALSA ROJA 200ML",
    base64_code: SecureRandom.base64(10),
    brand: b_004,
    unit_measure: um_cjs
})
Product.create({
    short_code: (Param.generate_nn("NN_PRODUCTS")), 
    long_code: (Product.generate_long_code(b_004,um_und)),
    description: "BOTELLA PICANTE SALSA VERDE 200ML",
    base64_code: SecureRandom.base64(10),
    brand: b_004,
    unit_measure: um_und
})
Product.create({
    short_code: (Param.generate_nn("NN_PRODUCTS")), 
    long_code: (Product.generate_long_code(b_004,um_cjs)),
    description: "BOTELLA PICANTE SALSA VERDE 200ML",
    base64_code: SecureRandom.base64(10),
    brand: b_004,
    unit_measure: um_cjs
})
Product.create({
    short_code: (Param.generate_nn("NN_PRODUCTS")), 
    long_code: (Product.generate_long_code(b_004,um_und)),
    description: "BOTELLA PICANTE SALSA VERDE 500ML",
    base64_code: SecureRandom.base64(10),
    brand: b_004,
    unit_measure: um_und
})
Product.create({
    short_code: (Param.generate_nn("NN_PRODUCTS")), 
    long_code: (Product.generate_long_code(b_001,um_und)),
    description: "PACK PUPUSAS CHICHARRON 12 UNIDADES",
    base64_code: SecureRandom.base64(10),
    brand: b_001,
    unit_measure: um_und
})
Product.create({
    short_code: (Param.generate_nn("NN_PRODUCTS")), 
    long_code: (Product.generate_long_code(b_001,um_und)),
    description: "PACK PUPUSAS QUESO 12 UNIDADES",
    base64_code: SecureRandom.base64(10),
    brand: b_001,
    unit_measure: um_und
})
Product.create({
    short_code: (Param.generate_nn("NN_PRODUCTS")), 
    long_code: (Product.generate_long_code(b_001,um_und)),
    description: "PACK PUPUSAS MIXTA 12 UNIDADES",
    base64_code: SecureRandom.base64(10),
    brand: b_001,
    unit_measure: um_und
})
Product.create({
    short_code: (Param.generate_nn("NN_PRODUCTS")), 
    long_code: (Product.generate_long_code(b_001,um_und)),
    description: "PACK PUPUSAS QUESO 24 UNIDADES + 2 EXTRA",
    base64_code: SecureRandom.base64(10),
    brand: b_001,
    unit_measure: um_und
})
Product.create({
    short_code: (Param.generate_nn("NN_PRODUCTS")), 
    long_code: (Product.generate_long_code(b_001,um_und)),
    description: "PACK PUPUSAS CHICHARRON 24 UNIDADES + 2 EXTRA",
    base64_code: SecureRandom.base64(10),
    brand: b_001,
    unit_measure: um_und
})
Product.create({
    short_code: (Param.generate_nn("NN_PRODUCTS")), 
    long_code: (Product.generate_long_code(b_001,um_und)),
    description: "PACK PUPUSAS MIXTA 24 UNIDADES + 2 EXTRA",
    base64_code: SecureRandom.base64(10),
    brand: b_001,
    unit_measure: um_und
})
Product.create({
    short_code: (Param.generate_nn("NN_PRODUCTS")), 
    long_code: (Product.generate_long_code(b_005,um_und)),
    description: "BOLSA DE HARINA 2KG",
    base64_code: SecureRandom.base64(10),
    brand: b_005,
    unit_measure: um_und
})
Product.create({
    short_code: (Param.generate_nn("NN_PRODUCTS")), 
    long_code: (Product.generate_long_code(b_005,um_und)),
    description: "BOLSA DE HARINA 5KG",
    base64_code: SecureRandom.base64(10),
    brand: b_005,
    unit_measure: um_und
})
Product.create({
    short_code: (Param.generate_nn("NN_PRODUCTS")), 
    long_code: (Product.generate_long_code(b_005,um_und)),
    description: "BOLSA DE HARINA INTEGRAL 1KG",
    base64_code: SecureRandom.base64(10),
    brand: b_005,
    unit_measure: um_und
})
Product.create({
    short_code: (Param.generate_nn("NN_PRODUCTS")), 
    long_code: (Product.generate_long_code(b_005,um_und)),
    description: "BOLSA DE HARINA INTEGRAL 2.5KG",
    base64_code: SecureRandom.base64(10),
    brand: b_005,
    unit_measure: um_und
})
Product.create({
    short_code: (Param.generate_nn("NN_PRODUCTS")), 
    long_code: (Product.generate_long_code(b_005,um_cjs)),
    description: "BOLSA DE HARINA INTEGRAL 1KG",
    base64_code: SecureRandom.base64(10),
    brand: b_005,
    unit_measure: um_cjs
})
Product.create({
    short_code: (Param.generate_nn("NN_PRODUCTS")), 
    long_code: (Product.generate_long_code(b_003,um_und)),
    description: "BOLSA POLLO CONGELADO 1KG",
    base64_code: SecureRandom.base64(10),
    brand: b_003,
    unit_measure: um_und
})
Product.create({
    short_code: (Param.generate_nn("NN_PRODUCTS")), 
    long_code: (Product.generate_long_code(b_003,um_und)),
    description: "BOLSA POLLO CONGELADO 3KG",
    base64_code: SecureRandom.base64(10),
    brand: b_003,
    unit_measure: um_und
})
Product.create({
    short_code: (Param.generate_nn("NN_PRODUCTS")), 
    long_code: (Product.generate_long_code(b_003,um_und)),
    description: "BOLSA POLLO CONGELADO 5KG",
    base64_code: SecureRandom.base64(10),
    brand: b_003,
    unit_measure: um_und
})
Product.create({
    short_code: (Param.generate_nn("NN_PRODUCTS")), 
    long_code: (Product.generate_long_code(b_003,um_und)),
    description: "BOLSA POLLO CONGELADO 7.5KG",
    base64_code: SecureRandom.base64(10),
    brand: b_003,
    unit_measure: um_und
})
Product.create({
    short_code: (Param.generate_nn("NN_PRODUCTS")), 
    long_code: (Product.generate_long_code(b_003,um_und)),
    description: "BOLSA POLLO CONGELADO EMPANIZADO 2KG",
    base64_code: SecureRandom.base64(10),
    brand: b_003,
    unit_measure: um_und
})
Product.create({
    short_code: (Param.generate_nn("NN_PRODUCTS")), 
    long_code: (Product.generate_long_code(b_003,um_und)),
    description: "BOLSA POLLO CONGELADO EMPANIZADO 5KG",
    base64_code: SecureRandom.base64(10),
    brand: b_003,
    unit_measure: um_und
})


