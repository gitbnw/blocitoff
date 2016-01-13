# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


50.times do
  password = Faker::Internet.password  
  user = User.new(
  :name => Faker::Name.name,
  :email => Faker::Internet.email,
  :password => password,
  :password_confirmation => password
  )    
  user.skip_confirmation!
  user.save!

  10.times do
 
    item = Item.new(
      :name => Faker::Lorem.sentence,
      :user => user
      )
    item.save!
  end
  
end
  user = User.new(
  :name => 'Byron Weiss',
  :email => 'byron.weiss@gmail.com',
  :password => 'helloworld',
  :password_confirmation => 'helloworld'
  )
  user.skip_confirmation!
  user.save!
  
  10.times do
    
    item = Item.new(
      :name => Faker::Lorem.sentence,
      :user => user
      )
    item.save!
    item.update_attribute("created_at", Date.today - rand(6))
  end
  
   user = User.new(
  :name => 'Byron Weiss',
  :email => 'bweiss@oak-park.us',
  :password => 'helloworld',
  :password_confirmation => 'helloworld'
  )
  user.skip_confirmation!
  user.save!
  
  10.times do
    
    item = Item.new(
      :name => Faker::Lorem.sentence,
      :user => user
      )
    item.save!
    
  end


 puts "#{User.count} users created"
 puts "#{Item.count} items created"