user = User.create(email: "test@abc.com", password: "asdasd", password_confirmation: "asdasd", first_name: "John", last_name: "Snow")
puts "1 user created!"
AdminUser.create(email: "admin@test.com", password: "asdfasdf", password_confirmation: "asdfasdf", first_name: "Admin", last_name: "Name")
puts "1 Admin User created"

100.times do |post|
  Post.create!(date: Date.today, rationale: "rationale content #{post}", user_id: user.id, overtime_request: 2.5)
end

puts "100 posts have been created!"