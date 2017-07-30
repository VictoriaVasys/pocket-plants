require 'rails_helper'

describe WikipediaService do
  context ".find_taxonomic_family_name(common_family_name)" do
    it "can translate common family names to scientific" do
        service = WikipediaService.new
        taxonomic_family_name = service.taxonomic_family_name("mallow family")

        expect(taxonomic_family_name).to be_a(String)
        expect(taxonomic_family_name).to eq("Malvaceae")
    end
  end
end