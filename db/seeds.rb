# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


 User.delete_all
 Agent.delete_all
 Agency.delete_all
 Package.delete_all	
 Pricelimit.delete_all
 @user = User.create(name: 'admin', email: 'admin@admin.com', password: 'password', password_confirmation: 'password',role: 'admin')

 @user.add_role :admin 
 Pricelimit.create(price: 50000)
 Pricelimit.create(price: 100000)
 Pricelimit.create(price: 150000)
 Pricelimit.create(price: 200000)
 Pricelimit.create(price: 250000)
 Pricelimit.create(price: 300000)
 Pricelimit.create(price: 350000)

 @user = User.create(name: 'user1', email: 'user1@user.com', password: 'password', password_confirmation: 'password',role: 'agent')
 @user = User.create(name: 'user2', email: 'user2@user.com', password: 'password', password_confirmation: 'password', role: 'agent')
 @user = User.create(name: 'agent1', email: 'agent1@agent.com', password: 'password', password_confirmation: 'password',role: 'agent')
 @user = User.create(name: 'agent2', email: 'agent2@agent.com', password: 'password', password_confirmation: 'password',role: 'agent')

 @agency1 = Agency.create(name: 'Apple Travels', phone: 123456, address: 'Hyderabad')
 @agency2 = Agency.create(name: 'Beta Travels', phone: 123456, address: 'Mumbai')
 @agency3 = Agency.create(name: 'Capital Travels', phone: 123456, address: 'Vijaywada')

 @package = Package.create!(name: 'Hyd Umrah', price:4000,duration: '7days',  agency_id: @agency1.id, starting_city: 'Hyderabad',  ticket_no: 20, trip_to: 'Umrah')
 @package = Package.create(name: 'Hyd Hajj', price:6000,duration: '7days',  agency_id: @agency1.id, starting_city: 'Hyderabad',  ticket_no: 20, trip_to: 'Hajj')
 @package = Package.create(name: 'Mumbai Umrah', price:11000,duration: '7days',  agency_id: @agency2.id, starting_city: 'Mumbai',  ticket_no: 20, trip_to: 'Umrah')
 @package = Package.create(name: 'Mumbai Hajj', price:10000,duration: '10days',  agency_id: @agency2.id, starting_city: 'Mumbai',  ticket_no: 20, trip_to: 'Hajj')
 @package = Package.create(name: 'Vijaywada Umrah', price:4000,duration: '10days',  agency_id: @agency3.id, starting_city: 'Vijaywada',  ticket_no: 20, trip_to: 'Umrah')
 @package = Package.create(name: 'Vijaywada Hajj', price:14000,duration: '7days',  agency_id: @agency3.id, starting_city: 'Vijaywada',  ticket_no: 20, trip_to: 'Hajj')
 @package = Package.create(name: 'Hyd Umrah 1', price:5000,duration: '10days',  agency_id: @agency3.id, starting_city: 'Hyderabad',  ticket_no: 20, trip_to: 'Umrah')
 @package = Package.create(name: 'Hyd Hajj 1', price:7000,duration: '7days',  agency_id: @agency3.id, starting_city: 'Hyderabad',  ticket_no: 20, trip_to: 'Hajj')
 @package = Package.create(name: 'Mumbai Umrah 1', price:12000,duration: '7days',  agency_id: @agency2.id, starting_city: 'Mumbai',  ticket_no: 20, trip_to: 'Umrah')
 @package = Package.create(name: 'Mumbai Hajj 1', price:9000,duration: '10days',  agency_id: @agency2.id, starting_city: 'Mumbai',  ticket_no: 20, trip_to: 'Hajj')
 @package = Package.create(name: 'Vijaywada Umrah 1', price:14000,duration: '7days',  agency_id: @agency1.id, starting_city: 'Vijaywada',  ticket_no: 20, trip_to: 'Umrah')
 @package = Package.create(name: 'Vijaywada Hajj 1', price:4000,duration: '7days',  agency_id: @agency1.id, starting_city: 'Vijaywada',  ticket_no: 20, trip_to: 'Hajj')
