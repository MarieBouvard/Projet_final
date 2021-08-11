require 'faker'
Faker::Config.locale = 'fr'

::Rails.application.config.action_mailer.perform_deliveries = false

User.destroy_all
Event.destroy_all
Attendance.destroy_all

ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end

puts 'Destoy all Tables and reset primary key'

10.times do
  user = User.new
  user.first_name = Faker::Name.first_name
  user.last_name = Faker::Name.last_name
  user.password = '123456'
  user.description = Faker::Lorem.paragraph(sentence_count: 10)
  user.email = "#{user.first_name}.#{user.last_name}@yopmail.com"
  user.save
end

puts "Created #{User.all.size} users"

20.times do
  event = Event.new
  event.start_date = Faker::Date.forward(days: 30)
  event.title = Faker::Esport.event
  event.description = Faker::Lorem.paragraph(sentence_count: 10)
  event.duration = rand(1..10) * 5
  event.price = rand(10..100)
  event.location = Faker::Address.city
  event.admin = User.all.sample
  event.save
end
puts 'Add 20 Events'