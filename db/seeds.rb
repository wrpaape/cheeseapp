initial_userbase = 20
initial_userbase.times do
  User.create(name: Faker::Name.name,
              password_digest: BCrypt::Password.create(Faker::Internet.password))
end

User.create(name: "admin",
            password_digest: BCrypt::Password.create("admin"))
initial_userbase += 1

initial_names = ["Limburger", "Abbaye de Belloc", "Blue", "Brie", "Queso Fresco", "Provolone", "American"]
initial_varieties = ["Fresh Soft", "Fresh Firm", "Soft", "Semi-soft", "Semi-Hard", "Hard", "Semi-Firm", "Firm"]

initial_names.each do |name|
  initial_varieties.sample(rand(initial_varieties.size)).each do |variety|
    Cheese.create(name: name,
                  variety: variety,
                  user_id: User.all.sample.id)
  end
end
