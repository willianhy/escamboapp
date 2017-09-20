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

  desc "Cria Anúncios Fake"
  task generate_ads: :environment do
    puts "Cadastrando ANÚNCIOS..."

    100.times do
      Ad.create!(
        title: Faker::Lorem.sentence([2, 3, 4, 5].sample),
        description: LeroleroGenerator.paragraph(Random.rand(3)),
        member: Member.all.sample,
        category: Category.all.sample
        )
    end

    puts "ANÚNCIOS cadastrados com sucesso!"
  end
end
