require 'faker'

namespace :utils do
  desc "Cria Adminstradores Fake"
  task generate_admins: :environment do

    puts "Cadastrando Administradores"

    10.times do
      Admin.create!(name: Faker::Name.name,
                    email: Faker::Internet.email,
                    password: "123456",
                    password_confirmation: "123456",
                    role: [0, 1].sample)
    end

    puts "Administradores cadastrados com sucesso!"
  end
end
