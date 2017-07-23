require 'rails_helper'

RSpec.describe PlantFamilyHabitat, type: :model do
  it { should belong_to :plant_family }
  it { should belong_to :habitat }
end
