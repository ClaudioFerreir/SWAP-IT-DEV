require 'faker'

puts 'start'

# Verifique se há pelo menos um usuário no banco de dados
user = User.first

# Se não houver usuário, crie um
if user.nil?
  user = User.create!(name: Faker::Name.name, email: Faker::Internet.email, password: 'password')
  puts "Created a default user with id: #{user.id}"
end

# Criando 5 "Stuff" associados ao primeiro usuário
5.times do
  name = Faker::Vehicle.manufacture
  description = Faker::Vehicle.car_options

  stuff = Stuff.create!(name: name, description: description, user_id: user.id)
  puts "Created stuff with id: #{stuff.id} for user #{user.id}"
end

puts 'end'
