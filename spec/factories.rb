FactoryGirl.define do
  factory :gvision_description do
    name "MyText"
    flower_photo nil
  end
  
  factory :favorite_picture do
    user nil
    flower_photo nil
  end
  
  factory :comment do
    body "MyText"
    user nil
    flower_photo nil
  end
  
  factory :flower_photo do
    assigned_name "MyText"
    storage_url "MyText"
    plant_family nil
    user nil
    location nil
  end
  
  factory :location do
    address_number 1
    street_name "MyText"
    city "MyText"
    state "MyText"
    country "MyText"
  end
  
  factory :plant_family_habitat do
    habitat nil
    plant_family nil
  end
  
  factory :habitat do
    name "MyText"
  end
  
  factory :user do
    email "MyText"
    username "MyText"
  end
  
  factory :plant_family do
    sequence :common_name do |n|
      "CommonName#{n}"
    end
    sequence :taxonomic_name do |n|
      "TaxonomicName#{n}"
    end
    growing_conditions "MyText"
    sample_photo_storage_url "MyText"
  end
  
end