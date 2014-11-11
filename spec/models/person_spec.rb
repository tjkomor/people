require 'rails_helper'

RSpec.describe Person, type: :model do
  context "when given correct data" do
    let(:data) do
      {
        first_name:    "Jorge",
        last_name:     "Téllez",
        photo_slug:    "photo",
        email_address: "jorge@example.com",
        looking_for:   "fun",
        best_at:       "Spanish",
        hidden:        "false",
        introduction:  "Hello!",
        github_url:    "http://example.com/github"
      }
    end

    it "is valid" do
      result = Person.create(data)
  
      expect(result).to be_valid
      expect(result.first_name).to    eq "Jorge"
      expect(result.last_name).to     eq "Téllez"
      expect(result.photo_slug).to    eq "photo"
      expect(result.email_address).to eq "jorge@example.com"
      expect(result.looking_for).to   eq "fun"
      expect(result.best_at).to       eq "Spanish"
      expect(result.hidden).to        eq false
      expect(result.introduction).to  eq "Hello!"
      expect(result.github_url).to    eq "http://example.com/github"
    end

    it "has a full_name" do
      result = Person.create(data)

      expect(result.full_name).to eq "Jorge Téllez"
    end

    it "generates a slug" do
      result = Person.create(data)

      expect(result.slug).to eq "jorge_tellez"
    end

    it "knows its slug" do
      result = Person.create(data).to_param
    
      expect(result).to eq "jorge_tellez"
    end

    it "has editable attributes" do
      attributes = %i(
        first_name 
        last_name 
        email_address
        github_url
        looking_for
        best_at
        cohort_id
        photo_slug
        hidden
        introduction
        )

      result = Person.editable_attributes

      expect(result).to eq attributes
    end

    it "has an image_url" do
      result = Person.create

      expect(result.image_url).to eq "students/no_photo.jpg"
      
      result.photo_slug = "photo"
      result.save

      expect(result.image_url).to eq "students/photo"
    end

    it "has projects" do
      result = Person.create

      expect(result.projects).not_to be_nil
    end

    it "has location interests" do
      result = Person.create
    
      expect(result.location_interests).not_to be_nil
    end

    it "has locations" do
      result = Person.create

      expect(result.locations).not_to be_nil
    end

    it "has active persons" do
      result = Person.create(data)

      expect(Person.active).to include result
    
      result = Person.create(hidden: true)

      expect(Person.active).not_to include result
    end
  end
end
