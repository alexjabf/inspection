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
#Role.create(name: "System Administrator", description: "Can manage the complete system.", branch_id: 1, protected: true, super_admin: true, branch_admin: false, company_admin: false)
#User.create(first_name: 'System', last_name: 'Administrator', username: 'administrator', email: 'emobile@emobile.com.mx', password: 'Password1', password_confirmation: 'Password1', confirmed_at: Date.today, branch_id: 1, role_id: 1)
User.create(first_name: 'System', last_name: 'Administrator', username: 'administrator', email: 'emobile@emobile.com.mx', password: 'Password1', password_confirmation: 'Password1', confirmed_at: Date.today)
