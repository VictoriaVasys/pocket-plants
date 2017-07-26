require 'rails_helper'

RSpec.describe FlowerPhoto, type: :model do
  it { should validate_presence_of(:assigned_name) }
  it { should validate_presence_of(:storage_url) }
  it { should validate_uniqueness_of(:storage_url) }
  
  it { should belong_to :user}
  it { should belong_to :habitat}
  it { should belong_to :plant_family}
  it { should belong_to :location}
  it { should have_many :gvision_descriptions}
  it { should have_many :comments}
  it { should have_many :favorites}
end
