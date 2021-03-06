require 'rails_helper'

RSpec.describe FlowerPhoto, type: :model do
  it { should validate_presence_of(:assigned_name) }
  it { should validate_presence_of(:storage_url) }
  
  it { should belong_to :user}
  it { should belong_to :plant_family}
  it { should have_many :gvision_descriptions}
  it { should have_many :comments}
  it { should have_many :favorites}
  
  it "should sanitize a name for urls" do
    flower_photo = create(:flower_photo)
    
    expect(flower_photo.sanitized_name).to eq(flower_photo.assigned_name.split(' ').join('%20'))
  end
end
