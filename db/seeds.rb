phases = ["Phase 0", "Phase 1", "Phase 2", "Phase 3", "Alumni"]
cohorts = ["Osprey", "Raccoons", "Rock Doves", "Eastern Moose", "Squirrels"]
cities = ["New York", "San Francisco", "Chicago"]
tags = ["Javascript", "Ruby", "Node", "git", "rspec", "angular", "foundation", "css", "html", "jQuery", "ActiveRecord"]

#Creates phases as categories
phases.each { |phase| Category.create(name: phase) }

#Creates Users
20.times {
  User.create(name: Faker::Name.name, email: Faker::Internet.email, password: Faker::Internet.password, score: 0, phase: phases.sample, city: cities.sample, cohort: cohorts.sample, pic_url: Faker::Avatar.image)
}

#Creates Articles
60.times {
  Article.create(title: Faker::Lorem.sentence, url: Faker::Internet.url, votes: 0, user_id: rand(1..20), category_id: rand(1..5))
}

#Creates tags
article = Article.all
article.each {|article| article.tags << Tag.create(name: tags.sample)}

