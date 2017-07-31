require 'rails_helper'

RSpec.describe PlantFamily, type: :model do
  it { should validate_presence_of :common_name }
  it { should validate_presence_of :taxonomic_name }
  it { should validate_uniqueness_of :taxonomic_name }
  
  it { should have_many :flower_photos}
end
