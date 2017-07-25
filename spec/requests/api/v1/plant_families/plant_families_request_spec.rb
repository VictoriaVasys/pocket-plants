require 'rails_helper'

describe "Plant Families API" do
  attr_reader :pf1, :pf2, :pf3
  
  before do
    @pf1, @pf2, @pf3 = create_list(:plant_family, 3)
  end
  
  it "provides plant families & attributes" do
    get '/api/v1/plant_families'
  
    expect(response).to be_success
  
    plant_families = JSON.parse(response.body)
    
    expect(plant_families.count).to eq(3)
    expect(plant_families.first).to have_key("common_name")
    expect(plant_families.first['common_name']).to eq(pf1.common_name)
    expect(plant_families.first).to have_key("taxonomic_name")
    expect(plant_families.first['taxonomic_name']).to eq(pf1.taxonomic_name)
    expect(plant_families.first).to_not have_key("growing_conditions")
    expect(plant_families.first).to_not have_key("sample_photo_storage_url")
  end
  
  it "can get a plant family by its id" do
    get "/api/v1/plant_families/#{pf2.id}"
    plant_family = JSON.parse(response.body)
  
    expect(response).to be_success
    expect(plant_family).to have_key("id")
    expect(plant_family).to have_key("common_name")
    expect(plant_family).to have_key("taxonomic_name")
    expect(plant_family["id"]).to eq(pf2.id)
    expect(plant_family["common_name"]).to eq(pf2.common_name)
    expect(plant_family["taxonomic_name"]).to eq(pf2.taxonomic_name)
  end
  
  it "can find a plant family by its scientific name" do
    get "/api/v1/plant_families/find?taxonomic_name=#{pf2.taxonomic_name}"
    plant_family = JSON.parse(response.body)
    
    expect(response).to be_success
    expect(plant_family).to have_key("id")
    expect(plant_family).to have_key("common_name")
    expect(plant_family).to have_key("taxonomic_name")
    expect(plant_family["id"]).to eq(pf2.id)
    expect(plant_family["common_name"]).to eq(pf2.common_name)
    expect(plant_family["taxonomic_name"]).to eq(pf2.taxonomic_name)
  end
  
  it "can find a plant family by its common name" do
    get "/api/v1/plant_families/find?common_name=#{pf2.common_name}"
    plant_family = JSON.parse(response.body)
    
    expect(plant_family).to have_key("id")
    expect(plant_family).to have_key("common_name")
    expect(plant_family).to have_key("taxonomic_name")
    expect(plant_family["id"]).to eq(pf2.id)
    expect(plant_family["common_name"]).to eq(pf2.common_name)
    expect(plant_family["taxonomic_name"]).to eq(pf2.taxonomic_name)
  end

end
