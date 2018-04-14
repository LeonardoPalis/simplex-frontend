# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

AdminUser.create!(email:"os@gmail.com", password: "123123")
print ("\nAdminUser created!")

Employee.create!(email: "leo@gmail.com", work_hours: 50, cpf: "08888888888", name:"Leonardo Palis")
print ("\nEmployee created!")
Employee.create!(email: "marcelo@gmail.com",  work_hours: 35,cpf: "08888888888", name:"Marcelo Rodrigues")
print ("\nEmployee created!")
Employee.create!(email: "felipe@gmail.com",  work_hours: 40,cpf: "08888888888", name:"Felipe Coelho")
print ("\nEmployee created!")
Employee.create!(email: "gunna@gmail.com", work_hours: 30, cpf: "08888888888", name:"Daniel Gunna")
print ("\nEmployee created!")

Product.create!(name: "LED Smart", description: "Luminaria inteligente", net_profit: 80)
print ("\nProduct created!")
Product.create!(name: "Simple LED", description: "Luminaria simples", net_profit: 60)
print ("\nProduct created!")
Product.create!(name: "Control", description: "Controle da luminaria", net_profit: 10)
print ("\nProduct created!")