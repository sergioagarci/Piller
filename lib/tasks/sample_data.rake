namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    Usuario.create!(name: "Example User",
                    email: "example@railstutorial.org",
                    password: "foobar",
                    password_confirmation: "foobar",
                    admin: true)
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      Usuario.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
    usuario = Usuario.all(limit: 6)
    50.times do
      titulo = " Titulo "
      content = "http://www.youtube.com/watch?v=9nqr8BSvoz0"
      comentario = " Comentarios... "
      usuario.each { |usuario| usuario.microvideos.create!(content: content, titulo: titulo, comentario: comentario) }
    end
  end
end
