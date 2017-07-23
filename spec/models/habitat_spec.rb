require 'rails_helper'

RSpec.describe Habitat, type: :model do
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }
  
  it { should have_many :flower_photos}
  it { should have_many :plant_families}
end
