FactoryGirl.define do
  factory :gvision_description do
    sequence :name do |n|
      "Name#{n}"
    end
    flower_photo nil
  end
  
  factory :favorite do
    favorite true
    user nil
    favorable_type nil
    favorable_id nil
  end
  
  factory :comment do
    body "MyText"
    user nil
    commentable_type nil
    commentable_id nil
  end
  
  factory :flower_photo do
    before(:create) do |flower_photo|
      flower_photo.user = create(:user)
      flower_photo.plant_family = create(:plant_family)
    end
    
    sequence :assigned_name do |n|
      "Name #{n}"
    end
    
    sequence :storage_url do |n|
      "URL#{n}"
    end
    
    factory :flower_photo_with_gvision_descriptions do
      after(:create) do |flower_photo|
        3.times do 
          flower_photo.gvision_descriptions << create(
            :gvision_description, 
            flower_photo_id: flower_photo.id
          )
        end 
      end 
    end
    
    factory :flower_photo_with_favorites do 
      after(:create) do |flower_photo|
        3.times do 
          flower_photo.favorites << create(
            :favorite, 
            favorable_id: flower_photo.id, 
            favorable_type: "FlowerPhoto", 
            user_id: flower_photo.user.id
          )
        end 
      end 
    end
    
    factory :flower_photo_with_comments do 
      after(:create) do |flower_photo|
        3.times do 
          flower_photo.comments << create(
            :comment, 
            commentable_id: flower_photo.id, 
            commentable_type: "FlowerPhoto", 
            user_id: flower_photo.user.id
          )
        end 
      end 
    end
    
  end
  
  factory :user do
    sequence :email do |n|
      "email#{n}"
    end
    sequence :username do |n|
      "username#{n}"
    end
    password "123"
    password_confirmation "123"
  end
  
  factory :plant_family do
    sequence :common_name do |n|
      "Common Name#{n}"
    end
    sequence :taxonomic_name do |n|
      "Taxonomic Name#{n}"
    end
  end
  
end