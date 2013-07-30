#-*- coding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Company.create(name: "eMobile", email1: "emobile@emobile.com.mx", email2: "emobile@emobile.com.mx", phone1: "(614) 414-1895", phone2: "(614) 247-9483", address1: "N/A", address2: "N/A", zip: 32125, city: "Chihuahua", state: "chihuahua", country: "Mexico", description: "Innovación y Consultoría Móvil, S.C.")
Branch.create(name: "eMobile", email1: "emobile@emobile.com.mx", email2: "emobile@emobile.com.mx", phone1: "(614) 414-1895", phone2: "(614) 247-9483", address1: "N/A", address2: "N/A", zip: 32125, city: "Chihuahua", state: "chihuahua", country: "Mexico", description: "Innovación y Consultoría Móvil, S.C.", company_id: 1)
Role.create(name: "System Administrator", description: "Can manage the complete system.", branch_id: 1, protected: true, super_admin: true, branch_admin: false, routes_admin: false, driver: false)
User.create(first_name: 'System', last_name: 'Administrator', username: 'administrator', email: 'emobile@emobile.com.mx', password: 'Password1', password_confirmation: 'Password1', confirmed_at: Date.today, branch_id: 1, role_id: 1, phone1: "(614) 414-1895", phone2: "(614) 247-9483", address1: "N/A", address2: "N/A", zip: 32125, city: "Chihuahua", state: "chihuahua", country: "Mexico", active: true)
Role.create(name: "Branch Administrator", description: "Can manage branch.", branch_id: 1, protected: true, super_admin: false, branch_admin: true, routes_admin: false, driver: false)
User.create(first_name: 'Branch', last_name: 'Administrator', username: 'branchadmin', email: 'emobile1@emobile.com.mx', password: 'Password1', password_confirmation: 'Password1', confirmed_at: Date.today, branch_id: 1, role_id: 2, phone1: "(614) 414-1895", phone2: "(614) 247-9483", address1: "N/A", address2: "N/A", zip: 32125, city: "Chihuahua", state: "chihuahua", country: "Mexico", active: true)
Role.create(name: "Routes Administrator", description: "Can manage routes.", branch_id: 1, protected: true, super_admin: false, branch_admin: false, routes_admin: true, driver: false)
User.create(first_name: 'Routes', last_name: 'Administrator', username: 'routesdmin', email: 'emobile2@emobile.com.mx', password: 'Password1', password_confirmation: 'Password1', confirmed_at: Date.today, branch_id: 1, role_id: 2, phone1: "(614) 414-1895", phone2: "(614) 247-9483", address1: "N/A", address2: "N/A", zip: 32125, city: "Chihuahua", state: "chihuahua", country: "Mexico", active: true)
Role.create(name: "Driver", description: "Can see routes.", branch_id: 1, protected: true, super_admin: false, branch_admin: false, routes_admin: false, driver: true)
User.create(first_name: 'Driver', last_name: 'User', username: 'driveruser', email: 'emobile3@emobile.com.mx', password: 'Password1', password_confirmation: 'Password1', confirmed_at: Date.today, branch_id: 1, role_id: 2, phone1: "(614) 414-1895", phone2: "(614) 247-9483", address1: "N/A", address2: "N/A", zip: 32125, city: "Chihuahua", state: "chihuahua", country: "Mexico", active: true)

Cellphone.create(phone_number: "(614) 123-4561", model: "iPhone 5s", brand: "Apple", color: "Black", ope_system: "iOS 7", imei: "12345678901234", user_id: 1, branch_id: 1)
Cellphone.create(phone_number: "(614) 123-4562", model: "iPhone 5", brand: "Apple", color: "White", ope_system: "iOS 7", imei: "12345672901234", user_id: 1, branch_id: 1)
Cellphone.create(phone_number: "(614) 123-4563", model: "iPhone 4s", brand: "Apple", color: "Black", ope_system: "iOS 6", imei: "12345674901234", user_id: 1, branch_id: 1)
Cellphone.create(phone_number: "(614) 123-4564", model: "iPhone 4", brand: "Apple", color: "White", ope_system: "iOS 6", imei: "12345678951234", user_id: 1, branch_id: 1)
Cellphone.create(phone_number: "(614) 123-4565", model: "iPhone 3s", brand: "Apple", color: "Black", ope_system: "iOS 5", imei: "12345678961234", user_id: 1, branch_id: 1)
Cellphone.create(phone_number: "(614) 123-4566", model: "Nokia Lumia", brand: "Nokia", color: "Black", ope_system: "windows phone", imei: "123456789012346", user_id: 2, branch_id: 2)
Cellphone.create(phone_number: "(614) 123-4567", model: "Razr D3", brand: "Motorola", color: "White", ope_system: "Android 2.1", imei: "123456778965456", user_id: 3, branch_id: 3)
Cellphone.create(phone_number: "(614) 123-4568", model: "Ilium", brand: "Lanix", color: "Pink", ope_system: "Android 4.0", imei: "963258741253601", user_id: 4, branch_id: 1)
Cellphone.create(phone_number: "(614) 123-4569", model: "iPhone 4s", brand: "Apple", color: "Black", ope_system: "iOS 7", imei: "123456965328547", user_id: 5, branch_id: 2)
Cellphone.create(phone_number: "(614) 123-4560", model: "Asha 205", brand: "Nokia", color: "White", ope_system: "windows phone", imei: "963258874569852", user_id: 6, branch_id: 3)

Truck.create(brand: "Mercedes-Benz", model: "MB1", branch_id: 1, plate_no: "as123", year: 2000)
Truck.create(brand: "Dina", model: "D1", branch_id: 1, plate_no: "as223", year: 2001)
Truck.create(brand: "Volvo", model: "V1", branch_id: 1, plate_no: "as323", year: 2002)
Truck.create(brand: "Mercedes-Benz", model: "MB2", branch_id: 1, plate_no: "as423", year: 2003)
Truck.create(brand: "Dina", model: "D2", branch_id: 1, plate_no: "as523", year: 2004)
Truck.create(brand: "Volvo", model: "V2", branch_id: 1, plate_no: "as623", year: 2005)
Truck.create(brand: "Mercedes-Benz", model: "MB3", branch_id: 1, plate_no: "as723", year: 2006)
Truck.create(brand: "Dina", model: "D3", branch_id: 1, plate_no: "as823", year: 2007)
Truck.create(brand: "Volvo", model: "V3", branch_id: 1, plate_no: "as923", year: 2008)
Truck.create(brand: "Mercedes-Benz", model: "MB4", branch_id: 1, plate_no: "as113", year: 2009)
Truck.create(brand: "Dina", model: "D4", branch_id: 1, plate_no: "as121", year: 2010)
Truck.create(brand: "Volvo", model: "V4", branch_id: 1, plate_no: "as133", year: 2011)
Truck.create(brand: "Mercedes-Benz", model: "MB5", branch_id: 1, plate_no: "as143", year: 2012)
Truck.create(brand: "Dina", model: "D5", branch_id: 1, plate_no: "as153", year: 2013)
Truck.create(brand: "Volvo", model: "V5", branch_id: 1, plate_no: "as163", year: 2014)

Client.create(first_name: 'Javier Alejandro', last_name: 'Ballesteros Fierro', email: 'cliente1@hotmail.com', fax: "(614) 123-4567", phone1: "(614) 123-4567", phone2: "(614) 123-4567", address1: "Calle No. 1234", address2: "Fracc. Las Huertas", city: "Chihuahua", state: "Chihuahua", zip: 31212, country: "Mexico", branch_id: 1)
Client.create(first_name: 'Manuel', last_name: 'Aguirre Lopez', email: 'cliente2@hotmail.com', fax: "(714) 345-6578", phone1: "(714) 502-8596", phone2: "(714) 126-2334", address1: "Calle No. 1235", address2: "Fracc. Olmos", city: "Queretaro", state: "Queretaro", zip: 31100, country: "Mexico", branch_id: 1)
Client.create(first_name: 'Osiel', last_name: 'Bonilla Quezada', email: 'cliente3@hotmail.com', fax: "(614) 265-856", phone1: "(614) 129-7856", phone2: "(614) 295-586", address1: "Calle No. 7586", address2: "Fracc. Infonavit", city: "Chihuahua", state: "Chihuahua", zip: 31485, country: "Mexico", branch_id: 1)
Client.create(first_name: 'Jhon', last_name: 'Smit', email: 'cliente4@hotmail.com', fax: "(758) 965-4567", phone1: "(758) 856-9865", phone2: "(758) 123-4567", address1: "Street No. 9865", address2: "Alcoas", city: "Amityville", state: "New York", zip: 96532, country: "USA", branch_id: 1)
Client.create(first_name: 'Laurie', last_name: 'Kirschner', email: 'cliente5@hotmail.com', fax: "(614) 345-4567", phone1: "(854) 789-6532", phone2: "(854) 986-9865", address1: "Street No. 8965 ", address2: "Ina", city: "Beverly Hills", state: "California", zip:89657, country: "USA", branch_id: 1)
Client.create(first_name: 'Alberto', last_name: 'Montes Velazquez', email: 'cliente6@hotmail.com', fax: "(652) 103-8542", phone1: "(652) 103-8542", phone2: "(652) 103-8542", address1: "Calle No. 987", address2: "Col. Centro", city: "Guadalajara", state: "Jalisco", zip: 98653, country: "Mexico", branch_id: 1)

Bill.create(name: "Javier Alejandro Ballesteros Fierro", rfc: "rfc1234567890", client_id: 1, fax: "(614) 123-4567", phone1: "(614) 123-4567", phone2: "(614) 123-4567", address1: "Calle No. 1234", address2: "Fracc. Las Huertas", city: "Chihuahua", state: "Chihuahua", zip: 31212, country: "Mexico", branch_id: 1)
Bill.create(name: "Manuel Aguirre Lopez", rfc: "agm3502124565", client_id: 2, fax: "(714) 345-6578", phone1: "(714) 564-9857 ", phone2: "(714) 657-9845", address1: "Calle No. 1235", address2: "Fracc. Las Olmos", city: "Queretaro", state: "Queretaro", zip: 31100, country: "Mexico", branch_id: 1)
Bill.create(name: "Osiel Bonilla Quezada", rfc: "obq1234585462", client_id: 3, fax: "(614) 265-856", phone1: "(614) 785-695", phone2: "(614) 256-695", address1: "Calle No.7586 ", address2: "Fracc. Las Huertas", city: "Chihuahua", state: "Chihuahua", zip: 31485, country: "Mexico", branch_id: 1)
Bill.create(name: "Jhon Smit", rfc: "jsa8546325418", client_id: 4, fax: "(758) 965-4567", phone1: "(758) 865-548", phone2: "(758) 695-9865", address1: "Street No. 9865", address2: "Alcoas", city: "Amitville", state: "New York", zip: 96532, country: "USA", branch_id: 1)
Bill.create(name: "Laurie Kirschner", rfc: "rfc1234567345", client_id: 5, fax: "(614) 345-4567", phone1: "(614) 345-4567", phone2: "(854) 986-6536", address1: "Street No. 8965", address2: "Ina", city: "Beverly Hills", state: "California", zip: 89657, country: "USA", branch_id: 1)
Bill.create(name: "Alberto Montes Velazquez", rfc: "mov1965081298", client_id: 6, fax: "(652) 103-8542", phone1: "(652) 103-8542", phone2: "(652) 103-8542", address1: "Calle No. 987 ", address2: "Col. Centro", city: "Guadalajara", state: "Jalisco", zip: 98653, country: "Mexico", branch_id: 1)

Driver.create(user_id: 1, truck_id: 1, branch_id: 1)
Driver.create(user_id: 2, truck_id: 2, branch_id: 1)
Driver.create(user_id: 3, truck_id: 3, branch_id: 1)
Driver.create(user_id: 4, truck_id: 4, branch_id: 1)
