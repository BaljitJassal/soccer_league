# By using the symbol ':user', we get Factory Girl to simulate the User model.
Factory.define :user do |user|
  user.name                  "Michael Hartl"
  user.email                 "mhartl@example.com"
  user.password              "foobar"
  user.password_confirmation "foobar"
end

Factory.sequence :email do |n|
  "person-#{n}@example.com"
end

Factory.define :player do |player|
  player.firstname                  "Fred"
  player.lastname                  "Flintstone"
  player.position                  "Midfielder"
end

Factory.define :team do |team|
  team.name                  "Aztex"
  team.address1                  "123 Main St."
end

