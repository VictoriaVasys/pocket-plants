require 'database_cleaner'

DatabaseCleaner.clean_with(:truncation)

class Seed
  def initialize
    generate_users
    # generate_plant_families
    generate_flower_photos
    # generate_favorites
    # generate_comments
    # generate_habitats
    # generate plant_family_habitats
    # generate_locations
  end
  
  def generate_users
    10.times do |i|
      User.create!(
        email: Faker::Internet.unique.email,
        username: Faker::HitchhikersGuideToTheGalaxy.unique.character,
        password: '123',
        password_confirmation: '123'
      )
      puts "#{i} user created"
    end
  end
  
  def generate_flower_photos
    10.times do |i|
      user = User.find(rand(1..User.count))
      plant_family = PlantFamily.create!(
        common_name: "Lily", 
        taxonomic_name: Faker::Lorem.unique.word
        )
      FlowerPhoto.create!(
        assigned_name: Faker::Food.ingredient,
        storage_url: Faker::Internet.unique.url,
        user_id: user.id,
        plant_family_id: 1
      )
      generate_gvision_descriptions(FlowerPhoto.last)
      generate_favorites(FlowerPhoto.last)
      generate_comments(FlowerPhoto.last)
      puts "#{i} flower photo created"
    end
  end
  
  def generate_gvision_descriptions(flower_photo)
    3.times do |i|
      GvisionDescription.create!(
        name: Faker::Coffee.notes,
        flower_photo_id: flower_photo.id
      )
      generate_favorites(GvisionDescription.last)
      puts "#{i} gvision description created"
    end
  end
  
  def generate_favorites(object)
    n = rand(0..5)
    n.times do |i|
      object.favorites.create!(
        favorite: true,
        user_id: rand(1..User.count)
      )
      puts "#{i} favorite created"
    end
  end
  
  def generate_comments(object)
    n = rand(0..3)
    n.times do |i|
      object.comments.create!(
        body: Faker::HitchhikersGuideToTheGalaxy.quote,
        user_id: rand(1..User.count)
      )
      puts "#{i} comment created"
      generate_favorites(Comment.last)
    end
  end
  
end

Seed.new


