# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


 @user = User.create(name: 'admin', email: 'admin@admin.com', password: 'password', password_confirmation: 'password')
 @user.add_role :admin 
 Pricelimit.create(price: 5000)
 Pricelimit.create(price: 10000)
 Pricelimit.create(price: 15000)
 @user = User.create(name: 'user1', email: 'user1@user.com', password: 'password', password_confirmation: 'password',role: 'user')
 @user = User.create(name: 'user2', email: 'user2@user.com', password: 'password', password_confirmation: 'password',role: 'user')
 @user = User.create(name: 'agent1', email: 'agent1@agent.com', password: 'password', password_confirmation: 'password',role: 'agent')
 @user = User.create(name: 'agent2', email: 'agent2@agent.com', password: 'password', password_confirmation: 'password',role: 'agent')
