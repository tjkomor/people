require 'rails_helper'

RSpec.describe Location, :type => :model do
  let(:data) do
    { name: "Denver" }
  end

  context "when given correct data" do    
    it "is created" do
      result = Location.create(data)
      
      expect(result).to be_valid
    end

    it "returns all the location names" do
      %w(Denver Berlin Rome Mexico Mexico).each do |name|
        Location.create(name: name)
      end

      result = Location.names
      expect(result).to       eq %w(Berlin Denver Mexico Rome)
      expect(result.count).to eq 4
    end

    it "returns all the active locations" do
      locations = %w(Denver Berlin Rome Mexico).each_with_index.map do |name, index|
        Location.create(name: name, location_interests_count: index)
      end

      result = locations.select { |location| location.location_interests_count > 0 }.sort

      expect(result).to eq Location.active
      expect(result.count).to eq 3
    end

    it "has location_location interests" do
      result = Location.create(data)
      expect(result.location_interests).not_to be_nil
    end

    it "has people" do
      result = Location.create(data)
      expect(result.people).not_to be_nil
    end
  end

  context "when given incorrect data" do 
    it "is invalid without a name" do
      result = Location.create

      expect(result).to be_invalid
    end

    it "is invalid if the name already exists" do
      Location.create(data)
      result = Location.create(data)

      expect(result).to be_invalid
    end
  end
end
