## Admin
Admin.create!(username: 'cordialcare_admin',
              password: 'password',
              password_confirmation: 'password') if Admin.find_by(username: 'cordialcare_admin').nil?
## Member Roles
name_of_members_role = ["Beauty Consultant",
                        "Beauty Consultant Leader",
                        "Team manager",
                        "Junior Director",
                        "Senior Director"]

name_of_members_role.each do |member_role|
  MemberRole.find_or_create_by(name: member_role)
end
## Locations
kz = Location.find_or_create_by(city: "Almaty", country:"Kazakhstan", code_country: "KZ")
Location.find_or_create_by(country: "Kazakhstan", city: "Nur-Sultan",code_country: "TSE")
t1 = Team.find_or_create_by(location: kz)

## Members
Member.create!(username: 'aazimov',
                      password: 'cordial123',
                      password_confirmation: 'cordial123',
                      first_name: 'Atabek',
                      last_name: 'Azimov',
                      birthday: "18/04/1999",
                      email: 'aazimov@cd.kz',
                      phone_number: 7752321771,
                      address: 'Zheltoksan, 111',
                      marital_status: 'Free',
                      role: MemberRole.find_by(name: "Beauty Consultant Leader"),
                      gender: 'Male', team: t1
               ) if Member.find_by(username: 'aazimov').nil?

## Product Categories

if ProductCategory.all.count == 0
  category_1 = ProductCategory.find_or_create_by(name: "Beauty care")
  category_1_1 = ProductCategory.create(name: "Health care")
  category__2_1 = ProductCategory.create(name: "Cosmetic", parent: category_1)
  category__2_2 = ProductCategory.create(name: "Device", parent: category_1)
  category__2_3 = ProductCategory.create(name: "Supplement", parent: category_1_1)
  category__3_1 = ProductCategory.create(name: "Skin care", parent: category__2_1)
  category__3_2 = ProductCategory.create(name: "Make up", parent: category__2_1)
  category__3_3 = ProductCategory.create(name: "Hair", parent: category__2_1)
  category__3_4 = ProductCategory.create(name: "Face", parent: category__2_2)
  category__3_5 = ProductCategory.create(name: "Vitamin", parent: category__2_3)
  category__3_6 = ProductCategory.create(name: "Blood circulation", parent: category__2_3)
  category__3_7 = ProductCategory.create(name: "Mineral", parent: category__2_3)
  category__3_8 = ProductCategory.create(name: "Protein", parent: category__2_3)
  category__3_9 = ProductCategory.create(name: "Ginseng", parent: category__2_3)
  category__3_10 = ProductCategory.create(name: "Kid", parent: category__2_3)
  category_4 = ProductCategory.create(name: "Toner", parent: category__3_1)
  category_4_1 = ProductCategory.create(name: "Cream", parent: category__3_1)
  category_4_2 = ProductCategory.create(name: "Wrinkle care", parent: category__3_1)
  category_4_3 = ProductCategory.create(name: "Special care ", parent: category__3_1)
  category_4_4 = ProductCategory.create(name: "Cleansing", parent: category__3_1)
  category_4_5 = ProductCategory.create(name: "Essense", parent: category__3_1)
  category_4_6 = ProductCategory.create(name: "Emulsion", parent: category__3_1)
  category_4_7 = ProductCategory.create(name: "Moisture", parent: category__3_1)
  category_4_8 = ProductCategory.create(name: "Sunblock", parent: category__3_1)
  category_4_9 = ProductCategory.create(name: "Mask", parent: category__3_1)
  category_4_10 = ProductCategory.create(name: "Lip", parent: category__3_1)
  category_4_11 = ProductCategory.create(name: "Cushion", parent: category__3_2)
  category_4_12 = ProductCategory.create(name: "Lip", parent: category__3_2)
  category_4_13 = ProductCategory.create(name: "Eye", parent: category__3_2)
  category_4_14 = ProductCategory.create(name: "Foundation", parent: category__3_2)
  category_4_15 = ProductCategory.create(name: "Nail", parent: category__3_2)
  category_4_16 = ProductCategory.create(name: "Hair care", parent: category__3_3)
  category_4_17 = ProductCategory.create(name: "Led mask", parent: category__3_4)
  category_4_18 = ProductCategory.create(name: "ETC", parent: category__3_4)
  category_4_19 = ProductCategory.create(name: "Multi vitamin", parent: category__3_5)
  category_4_20 = ProductCategory.create(name: "Vitamin A", parent: category__3_5)
  category_4_21 = ProductCategory.create(name: "Vitamin B", parent: category__3_5)
  category_4_22 = ProductCategory.create(name: "Vitamin C", parent: category__3_5)
  category_4_23 = ProductCategory.create(name: "Vitamin D", parent: category__3_5)
  category_4_24 = ProductCategory.create(name: "Omega 3", parent: category__3_6)
  category_4_25 = ProductCategory.create(name: "A", parent: category__3_6)
  category_4_26 = ProductCategory.create(name: "B", parent: category__3_6)
  category_4_27 = ProductCategory.create(name: "A", parent: category__3_7)
  category_4_28 = ProductCategory.create(name: "B", parent: category__3_7)
  category_4_29 = ProductCategory.create(name: "A", parent: category__3_8)
  category_4_30 = ProductCategory.create(name: "B", parent: category__3_8)
  category_4_31 = ProductCategory.create(name: "A", parent: category__3_9)
  category_4_32 = ProductCategory.create(name: "B", parent: category__3_9)
  category_4_33 = ProductCategory.create(name: "A", parent: category__3_10)
  category_4_33 = ProductCategory.create(name: "A", parent: category__3_10)
end

## Sales types
SaleType.find_or_create_by(name: "Self purchasing")
SaleType.find_or_create_by(name: "New member")
SaleType.find_or_create_by(name: "Non-member")

## Brands
es = Brand.find_or_create_by(name: "ESROOM")
well = Brand.find_or_create_by(name: "WELL NATURE")

## Products
category = ProductCategory.find_by(name: "Beauty care")
Product.find_or_create_by(name: "Recovery All in One Solution",
                          sales_price: 20000,
                          brand_id: es.id,
                          category: category,
                          unit_price: 30000,
                          unit_type: '200ml',
                          basic_commission: 25,
                          total_commission: 50)

Product.find_or_create_by(name: "Recovery Memory Cream",
                          sales_price: 25000,
                          category: category,
                          brand_id: es.id,
                          unit_price: 40000,
                          unit_type: '50ml',
                          basic_commission: 25,
                          total_commission: 53)

Product.find_or_create_by(name: "Recovery Wrinkle Set",
                          brand_id: es.id,
                          category: category,
                          unit_price: 35000,
                          sales_price: 30000,
                          unit_type: '25ml',
                          basic_commission: 25,
                          total_commission: 42)

Product.find_or_create_by(name: "Recovery Relaxing Mask",
                          brand_id: es.id,
                          category: category,
                          unit_price: 12000,
                          sales_price: 10000,
                          unit_type: '25ml',
                          basic_commission: 20,
                          total_commission: 40)

Product.find_or_create_by(name: "Recovery Nourishing Mask",
                          brand_id: es.id,
                          category: category,
                          unit_price: 12000,
                          sales_price: 10000,
                          unit_type: '25ml',
                          basic_commission: 20,
                          total_commission: 40)

Product.find_or_create_by(name: "Recovery Perfect Cover Cushion (no.21)",
                          brand_id: es.id,
                          category: category,
                          unit_price: 18000,
                          sales_price: 15000,
                          basic_commission: 20,
                          total_commission: 40,
                          unit_type: '15g')

Product.find_or_create_by(name: "Recovery Perfect Cover Cushion (no.23)",
                          brand_id: es.id,
                          category: category,
                          unit_price: 18000,
                          sales_price: 15000,
                          basic_commission: 20,
                          total_commission: 40,
                          unit_type: '15g')

Product.find_or_create_by(name: "Moisture Speed Mist Toner",
                          brand_id: well.id,
                          category: category,
                          unit_price: 10000,
                          sales_price: 8000,
                          unit_type: '155ml',
                          basic_commission: 20,
                          total_commission: 45)

Product.find_or_create_by(name: "Moisture Seed Barrier Emulsion",
                          brand_id: well.id,
                          category: category,
                          unit_price: 10000,
                          sales_price: 8000,
                          unit_type: '155ml',
                          basic_commission: 20,
                          total_commission: 45)

Product.find_or_create_by(name: "Moisture Seed Capsule Essence",
                          brand_id: well.id,
                          category: category,
                          unit_price: 11000,
                          sales_price: 9000,
                          unit_type: '50ml',
                          basic_commission: 20,
                          total_commission: 42)

Product.find_or_create_by(name: "Moisture Seed Capsule Cream",
                          brand_id: well.id,
                          category: category,
                          unit_price: 11000,
                          sales_price: 9000,
                          unit_type: '50ml',
                          basic_commission: 20,
                          total_commission: 42)

Product.find_or_create_by(name: "Moisture Seed Safety Sunblock",
                          brand_id: well.id,
                          category: category,
                          unit_price: 8000,
                          sales_price: 6500,
                          unit_type: '40ml',
                          basic_commission: 20,
                          total_commission: 43)

Product.find_or_create_by(name: "Moisture Deep Cleansing Oil",
                          brand_id: well.id,
                          category: category,
                          unit_price: 10000,
                          sales_price: 8000,
                          unit_type: '170ml',
                          basic_commission: 20,
                          total_commission: 45)

Product.find_or_create_by(name: "Moisture Deep Cleansing Water",
                          brand_id: well.id,
                          category: category,
                          unit_price: 8000,
                          sales_price: 6500,
                          unit_type: '300ml',
                          basic_commission: 20,
                          total_commission: 43)

Product.find_or_create_by(name: "Moisture Whipping Cleansing Foam",
                          brand_id: well.id,
                          category: category,
                          unit_price: 6500,
                          sales_price: 5000,
                          unit_type: '150ml',
                          basic_commission: 20,
                          total_commission: 50)

Product.find_or_create_by(name: "Moisture Lip Care Set",
                          brand_id: well.id,
                          category: category,
                          unit_price: 7000,
                          sales_price: 5500,
                          unit_type: '8g',
                          basic_commission: 20,
                          total_commission: 47)