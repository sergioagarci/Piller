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

    #make_relationships
    usuarios = Usuario.all
    usuario  = usuarios.first
    followed_users = usuarios[2..50]
    followers      = usuarios[3..40]
    followed_users.each { |followed| usuario.follow!(followed) }
    followers.each      { |follower| follower.follow!(usuario) }
  end
end
