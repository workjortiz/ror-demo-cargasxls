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
# rails g Brand name:string code:string country:reference
# rails g UnitMeasure name:string iso_code:string
# rails g Product short_code:integer long_code:string description:string base64_code: string brand:reference unit_measure:reference

# SOURCE
# ISO COUNTRIES: https://www.iban.com/country-codes
# DIAL REGION CODE: https://countrycode.org/

# TERMINAL COMMAND
# rake db:seed

Product.destroy_all
Brand.destroy_all
Country.destroy_all
UnitMeasure.destroy_all

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
    {name: "LAS PUSUSAS", code: "SC0001", country: c_slv},
    {name: "TIPICOS", code: "SR0002", country: c_slv},
    {name: "POLLERIA", code: "MR0001", country: c_mex},
    {name: "PICANTE, S.A.", code: "MC0001", country: c_mex},
    {name: "HARINA Y MASAPAN", code: "MC0002", country: c_mex},
    {name: "TEXMEX", code: "MC0003", country: c_mex},
    {name: "CENTRO COMESTIBLE", code: "GD0001", country: c_gtm},
])

b_001 = Brand.find_by_code("SC0001")
b_002 = Brand.find_by_code("SR0002")
b_003 = Brand.find_by_code("MR0001")
b_004 = Brand.find_by_code("MC0001")
b_005 = Brand.find_by_code("MC0002")
b_006 = Brand.find_by_code("GD0001")

Product.create([
    {
        short_code: b_004.id*1000+1, 
        long_code: "MXMC000U1001",
        description: "BOTELLA PICANTE SALSA ROJA 200ML",
        base64_code: SecureRandom.base64(10),
        brand: b_004,
        unit_measure: um_und
    },
    {
        short_code: b_004.id*1100+1, 
        long_code: "MXMC000C1001",
        description: "BOTELLA PICANTE SALSA ROJA 200ML",
        base64_code: SecureRandom.base64(10),
        brand: b_004,
        unit_measure: um_cjs
    },
    {
        short_code: b_004.id*1000+2, 
        long_code: "MXMC000U1002",
        description: "BOTELLA PICANTE SALSA VERDE 200ML",
        base64_code: SecureRandom.base64(10),
        brand: b_004,
        unit_measure: um_und
    },
    {
        short_code: b_004.id*1100+2, 
        long_code: "MXMC000C1002",
        description: "BOTELLA PICANTE SALSA VERDE 200ML",
        base64_code: SecureRandom.base64(10),
        brand: b_004,
        unit_measure: um_cjs
    },
    {
        short_code: b_004.id*1000+3, 
        long_code: "MXMC000U1003",
        description: "BOTELLA PICANTE SALSA VERDE 500ML",
        base64_code: SecureRandom.base64(10),
        brand: b_004,
        unit_measure: um_und
    },
    {
        short_code: b_001.id*1000+1, 
        long_code: "SVSC000U1001",
        description: "PACK PUPUSAS CHICHARRON 12 UNIDADES",
        base64_code: SecureRandom.base64(10),
        brand: b_001,
        unit_measure: um_und
    },
    {
        short_code: b_001.id*1000+2, 
        long_code: "SVSC000U1002",
        description: "PACK PUPUSAS QUESO 12 UNIDADES",
        base64_code: SecureRandom.base64(10),
        brand: b_001,
        unit_measure: um_und
    },
    {
        short_code: b_001.id*1000+3, 
        long_code: "SVSC000U1003",
        description: "PACK PUPUSAS QUESO 24 UNIDADES + 2 EXTRA",
        base64_code: SecureRandom.base64(10),
        brand: b_001,
        unit_measure: um_und
    },
    {
        short_code: b_005.id*1000+1, 
        long_code: "MXMC000U1001",
        description: "BOLSA DE HARINA 2KG",
        base64_code: SecureRandom.base64(10),
        brand: b_005,
        unit_measure: um_und
    },
    {
        short_code: b_005.id*1000+2, 
        long_code: "MXMC000U1002",
        description: "BOLSA DE HARINA 5KG",
        base64_code: SecureRandom.base64(10),
        brand: b_005,
        unit_measure: um_und
    },
    {
        short_code: b_005.id*1000+3, 
        long_code: "MXMC000U2001",
        description: "BOLSA DE HARINA INTEGRAL 1KG",
        base64_code: SecureRandom.base64(10),
        brand: b_005,
        unit_measure: um_und
    },
    {
        short_code: b_005.id*1100+3, 
        long_code: "MXMC000C2001",
        description: "BOLSA DE HARINA INTEGRAL 1KG",
        base64_code: SecureRandom.base64(10),
        brand: b_005,
        unit_measure: um_cjs
    },
    {
        short_code: b_003.id*1000+1, 
        long_code: "MXMR000U1001",
        description: "BOLSA POLLO CONGELADO 1KG",
        base64_code: SecureRandom.base64(10),
        brand: b_003,
        unit_measure: um_und
    },
    {
        short_code: b_003.id*1000+2, 
        long_code: "MXMR000U1002",
        description: "BOLSA POLLO CONGELADO 3KG",
        base64_code: SecureRandom.base64(10),
        brand: b_003,
        unit_measure: um_und
    },
    {
        short_code: b_003.id*1000+3, 
        long_code: "MXMR000U1003",
        description: "BOLSA POLLO CONGELADO 5KG",
        base64_code: SecureRandom.base64(10),
        brand: b_003,
        unit_measure: um_und
    },
    {
        short_code: b_003.id*1000+4, 
        long_code: "MXMR000U2001",
        description: "BOLSA POLLO CONGELADO EMPANIZADO 2KG",
        base64_code: SecureRandom.base64(10),
        brand: b_003,
        unit_measure: um_und
    },
    {
        short_code: b_003.id*1000+5, 
        long_code: "MXMR000U2002",
        description: "BOLSA POLLO CONGELADO EMPANIZADO 5KG",
        base64_code: SecureRandom.base64(10),
        brand: b_003,
        unit_measure: um_und
    }
])

