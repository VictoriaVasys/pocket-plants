require 'rails_helper'

RSpec.describe Location, type: :model do
  it { should validate_presence_of :city }
  it { should validate_presence_of :country }
  
  it { should have_many :flower_photos }
end
