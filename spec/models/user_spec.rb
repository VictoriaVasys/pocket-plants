require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of :username }
  it { should validate_uniqueness_of (:username) } #.ignoring_case_sensitivity ?
  it { should validate_presence_of :email }
  it { should validate_uniqueness_of :email }
  
  # it { should have_secure_password }
  
  it { should have_many :flower_photos}
  it { should have_many :favorites}
  it { should have_many :comments}
end
