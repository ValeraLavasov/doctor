# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password',
                  password_confirmation: 'password')
MedicalDoctor.create!(email: 'doctor@example.com', password: 'password',
                password_confirmation: 'password', last_name: 'Doctor',
                first_name: 'Who')
Patient.create!(email: 'patient@example.com', password: 'password',
                password_confirmation: 'password', last_name: 'Test1',
                first_name: 'Test2')