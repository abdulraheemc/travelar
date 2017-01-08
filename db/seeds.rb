# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

 @user = User.create(email: 'email@admin.com', password: 'password', password_confirmation: 'password', name: 'admin')
 @user.add_role :admin 
 Pricelimit.create(price: 5000)
 Pricelimit.create(price: 10000)
 Pricelimit.create(price: 15000)

 @user = User.create(email: 'user1@user.com', password: 'password', password_confirmation: 'password', name: 'user1')
 @user = User.create(email: 'user2@user.com', password: 'password', password_confirmation: 'password', name: 'user2')
 @user = User.create(email: 'agent1@agent.com', password: 'password', password_confirmation: 'password', name: 'user3')
 