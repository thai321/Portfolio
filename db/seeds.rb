# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


3.times do |topic|
	Topic.create!(
		title: "Topic #{topic}"
	)
end

10.times do |blog|
	Blog.create!(
		title: "My blog Post #{blog}",
		body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
		Praesent molestie nisi massa, at lacinia nibh efficitur nec.
		 Nullam venenatis cursus sapien ac molestie. Fusce venenatis 
		 nibh augue. Vivamus laoreet nulla eget vulputate placerat. 
		 Aliquam erat volutpat. Vestibulum euismod velit urna, sit amet 
		 efficitur erat posuere nec. Nullam elementum ultricies velit, 
		 sit amet molestie nulla sodales quis. Curabitur eu gravida eros, 
		 quis ullamcorper nibh. Cras at hendrerit turpis. 
		 Phasellus cursus dui vel massa eleifend, 
		 vitae ultricies tellus finibus. Integer non ligula magna. 
		 Sed aliquam lacinia egestas. Maecenas euismod facilisis ex, 
		 sit amet auctor erat rhoncus non.
		",
		topic_id: Topic.last.id
	)
end

puts "10 blog posts created!"

5.times do |skill|
	Skill.create!(
		title: "Rails #{skill}",
		percent_utilized: 15
	)
end

puts "5 skills created!"

8.times do |portfolio_item|
	Portfoli.create!(
		title: "Portfolio title: #{portfolio_item}",
		subtitle: "Ruby on Rails",
		body: "Quisque ut porta purus. 
			Nunc dignissim lobortis erat, 
			sit amet laoreet mi consectetur suscipit. 
			Donec eu gravida metus. Duis vestibulum, est quis rutrum 
			commodo, leo ligula aliquam lectus, eget maximus diam ipsum 
			non risus. Pellentesque vulputate vehicula mi. 
			Vestibulum ante ipsum primis in faucibus orci luctus et 
			ultrices posuere cubilia Curae; Etiam a elementum nunc. 
			Sed pharetra nulla nec eros efficitur, 
			sit amet hendrerit eros suscipit. 
			Nam posuere molestie turpis vitae pharetra. 
			Cras vel tortor egestas, consequat lacus sed, varius ante.",
		main_image: "http://placehold.it/600x400",
		thumb_image: "http://placehold.it/350x200"
	)
end

1.times do |portfolio_item|
	Portfoli.create!(
		title: "Portfolio title: #{portfolio_item}",
		subtitle: "Angular",
		body: "Quisque ut porta purus. 
			Nunc dignissim lobortis erat, 
			sit amet laoreet mi consectetur suscipit. 
			Donec eu gravida metus. Duis vestibulum, est quis rutrum 
			commodo, leo ligula aliquam lectus, eget maximus diam ipsum 
			non risus. Pellentesque vulputate vehicula mi. 
			Vestibulum ante ipsum primis in faucibus orci luctus et 
			ultrices posuere cubilia Curae; Etiam a elementum nunc. 
			Sed pharetra nulla nec eros efficitur, 
			sit amet hendrerit eros suscipit. 
			Nam posuere molestie turpis vitae pharetra. 
			Cras vel tortor egestas, consequat lacus sed, varius ante.",
		main_image: "http://placehold.it/600x400",
		thumb_image: "http://placehold.it/350x200"
	)
end

puts "9 portfolios created!"


3.times do |technology|
	Portfoli.last.technologies.create!(
		name: "Technology #{technology}"
	)
end

puts "3 technologies created!"


User.create!(name: "Thai Nguyen", email: "test@test.com", roles: :site_admin, password: "123456")
puts "1 site admin has created"
