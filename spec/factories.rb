FactoryGirl.define do
  factory :gvision_description do
    sequence :name do |n|
      "Name#{n}"
    end
    flower_photo nil
    
    factory :gvision_description_with_favorites do 
      after(:create) do |gvision_description|
        3.times do 
          gvision_description.favorites << create(
            :favorite, 
            favorable_id: gvision_description.id, 
            favorable_type: "GvisionDescription", 
            user_id: gvision_description.flower_photo.user.id
          )
        end 
      end 
    end
  end
  
  factory :favorite do
    user nil
    favorable_type nil
    favorable_id nil
  end
  
  factory :comment do
    body "MyText"
    user nil
    commentable_type nil
    commentable_id nil
    
    factory :comment_with_favorites do 
      after(:create) do |comment|
        3.times do 
          comment.favorites << create(
            :favorite, 
            favorable_id: comment.id, 
            favorable_type: "Comment", 
            user_id: comment.user.id
          )
        end 
      end 
    end
  end
  
  factory :flower_photo do
    before(:create) do |flower_photo|
      flower_photo.user = create(:user)
      flower_photo.plant_family = create(:plant_family)
    end
    
    sequence :assigned_name do |n|
      "Name #{n}"
    end
    
    storage_url "https://00e9e64bac8faaf3ffa8b34c49f36769ce6c63255c4f5f6f2a-apidata.googleusercontent.com/download/storage/v1/b/flower-photos/o/poppy-california-gold-west-x2.jpg?qk=AD5uMEuzalLd48rFlGgI4dFlPKZUgRbHYupGO-iw9_UkuYjQIdaCcNUf7o2u5wekE05ikWBqf51v2-i6CPbZ-c5U20a0w20k1qNSQeUm17xCMBzov2CNz_6Acnm3lwExx_-O-V7u8tc-v58DMiH78_IIPoGSFfZEO8InLpYL7URlrushEwUlo-LuO1Y0wOG46-0zoLnaUMR5Kqyig90DXZdCy7HI0mcDVYlDdZqqDE3TQrYjDc50XT7DF91g05oQuiSmxxnHHGqX34VURVCPMchHjfDf4vOBnNcnxieISB67Eo44NtN0lYkUiZb4T9-0gHOtPxsSx15L5PabJAwE0dmM5vd25WJ3-Ggr_CHVAXmzxY-J2xZkbTvavkGXPoXQg5NQdey_5RSzwb205rR9xWFDX0a2TtuFsLEIRA2KGi6JWPM8hsWwFt__m4Dsa0NEqyq4SplkUfBYiSVAOq1ooIkwyvDzabxptYJjEFjeLvLPZ406IdsREe0MVrA6nOnBTHk8CW4sxg_aMihPVEdr1gPWjrYbE92MO_PIH4xZ_BImvC33WFXSVUjXj33ghoRuhbybdF-YadzUV3-hbXgYawyg6t25KhFt0VLHV14Lg7DuYLQ1-dKqZ0XwtCdh3PvwyI6o9uPHPa9ig8ziqwa8vTbnzA4cUa0m-mQOnJfJB7kHQYypkkjddKeQqloldf7ZLZCzynICWMmDvECBhp7N_tDa_Y0aMWvFAapQcKOXD7QiXky9WhqwMyaHg298LDN80rd5K68Z8rklMsGjaSmptzjcva6gw53P_fg2amrfoP740M6922apvPM"
    
    factory :flower_photo_with_favorites do 
      after(:create) do |flower_photo|
        3.times do 
          flower_photo.favorites << create(
            :favorite, 
            favorable_id: flower_photo.id, 
            favorable_type: "FlowerPhoto", 
            user_id: create(:user).id
          )
        end 
      end 
    end
    
    factory :flower_photo_with_gvision_descriptions do
      after(:create) do |flower_photo|
        3.times do 
          flower_photo.gvision_descriptions << create(
          :gvision_description_with_favorites, 
          flower_photo_id: flower_photo.id
          )
        end 
      end 
    end
    
    factory :flower_photo_with_comments do 
      after(:create) do |flower_photo|
        3.times do 
          flower_photo.comments << create(
            :comment_with_favorites, 
            commentable_id: flower_photo.id, 
            commentable_type: "FlowerPhoto", 
            user_id: create(:user).id
          )
        end 
      end 
    end
    
    factory :flower_photo_with_the_works do
      after(:create) do |flower_photo|
        3.times do 
          flower_photo.favorites << create(
            :favorite, 
            favorable_id: flower_photo.id, 
            favorable_type: "FlowerPhoto", 
            user_id: create(:user).id
          )
        end
          
        3.times do 
          flower_photo.gvision_descriptions << create(
          :gvision_description_with_favorites, 
          flower_photo_id: flower_photo.id
          )
        end
        
        3.times do 
          flower_photo.comments << create(
            :comment_with_favorites, 
            commentable_id: flower_photo.id, 
            commentable_type: "FlowerPhoto", 
            user_id: create(:user).id
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