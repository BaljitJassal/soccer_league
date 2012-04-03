Factory.sequence :username do |n|
  "user#{n}"
end

Factory.sequence :email do |n|
  "person-#{n}@example.com"
end

Factory.sequence :name do |n|
  "some Team FC-#{n}"
end

Factory.sequence :lastname do |n|
  "Van Playerson#{n}"
end

Factory.define :user do |user|
  user.username               Factory.next(:username)
  user.email                  Factory.next(:email)
  user.password              "foobar"
  user.password_confirmation "foobar"
  user.roles                  [:admin]
  user.updated_by_id 1
end

Factory.define :player do |player|
  player.firstname                  "Fred"
  player.lastname                  Factory.next(:lastname)
  player.position                  Player::POSITIONS.values.first
  player.birth_date                  "09/22/1981"
  player.nationality                  "USA"
  player.created_by_id 1
  player.updated_by_id 1
end

Factory.define :team do |team|
  team.name                  "Austin FC"
  team.address1                  "123 Main St."
  team.address2                  "Apt A"
  team.city                  "Austin"
  team.state                  "TX"
  team.zip                  "78704"
  team.phone                  "512-123-4567"
  team.website                  "http://foo.com"
  team.email                  "test@foo.com"
  team.created_by_id 1
  team.updated_by_id 1
end

Factory.define :organization do |org|
  org.founded                 1913
  org.name                 "United States Soccer Federation"
  org.created_by_id 1
  org.updated_by_id 1
end

Factory.define :league do |league|
  league.year                 2002
  league.name                 "my soccer league"
  league.organization { |org|  org.association(:organization) }
  league.created_by_id 1
  league.updated_by_id 1
end

Factory.define :teamstat do |teamstat|
  teamstat.created_by_id 1
  teamstat.team { |team|  team.association(:team, :name => Factory.next(:name)) }
  teamstat.league { |league|  league.association(:league) }
  teamstat.updated_by_id 1
end

Factory.define :playerstat do |playerstat|
  playerstat.player { |player|  player.association(:player) }
  playerstat.game { |game|  game.association(:game) }
  playerstat.team { |team|  team.association(:team) }
  playerstat.created_by_id 1
  playerstat.updated_by_id 1
end

Factory.define :roster do |roster|
  roster.player { |player|  player.association(:player, :lastname => Factory.next(:lastname)) }
  roster.teamstat { |teamstat|  teamstat.association(:teamstat) }
  roster.created_by_id 1
  roster.updated_by_id { |user|  user.association(:user, :username => Factory.next(:username)) }
end

Factory.define :game do |game|
  game.league { |league|  league.association(:league) }
  game.visiting_team { |visiting_team|  visiting_team.association(:team, :name => Factory.next(:name))  }
  game.home_team { |home_team|  home_team.association(:team, :name => Factory.next(:name))  }
  game.created_by_id 1
  game.updated_by_id 1
end