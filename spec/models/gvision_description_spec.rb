require 'rails_helper'

RSpec.describe GvisionDescription, type: :model do
  it { should validate_presence_of(:name) }
  
  it { should belong_to :flower_photo}
  it { should have_many :favorites}
end
