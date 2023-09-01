# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# Crea comunas
comunas = ['Comuna 1', 'Comuna 2', 'Comuna 3', 'Comuna 4', 'Comuna 5']
comunas.each do |comuna|
  Comuna.create(name: comuna)
end

# Crea usuarios (admins y vendedores)
admin1 = User.create(email: 'admin1@example.com', password: '123456', role: 'admin')
admin2 = User.create(email: 'admin2@example.com', password: '123456', role: 'admin')
vendedor1 = User.create(email: 'vendedor1@example.com', password: '123456', role: 'vendedor')
vendedor2 = User.create(email: 'vendedor2@example.com', password: '123456', role: 'vendedor')
vendedor3 = User.create(email: 'vendedor3@example.com', password: '123456', role: 'vendedor')

# Crea edificios y departamentos
10.times do
  edificio = Edificio.create(
    nombre: Faker::Company.name,
    direccion: Faker::Address.street_address,
    comuna_id: Comuna.all.sample.id,
    piscina: [true, false].sample,
    quincho: [true, false].sample,
    gimnasio: [true, false].sample,
    areas_verdes: [true, false].sample,
    juegos_infantiles: [true, false].sample,
    estacionamiento: [true, false].sample,
    pet_friendly: [true, false].sample
  )

  3.times do
    Departamento.create(
      numero: Faker::Number.unique.number(digits: 3),
      precio: Faker::Number.number(digits: 7),
      habitaciones: Faker::Number.between(from: 1, to: 5),
      baños: Faker::Number.between(from: 1, to: 3),
      estado: 'disponible',
      modalidad: ['venta', 'arriendo'].sample,
      edificio_id: edificio.id
    )
  end
end

puts "Seeds created successfully!"
