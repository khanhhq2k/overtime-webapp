user = User.create(email: "test@abc.com", password: "asdasd", password_confirmation: "asdasd", first_name: "John", last_name: "Snow")
puts "1 user created!"

100.times do |post|
	Post.create!(date: Date.today, rationale: "rationale content #{post}", user_id: user.id)
end

puts "100 posts have been created!"