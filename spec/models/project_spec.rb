require 'rails_helper'

RSpec.describe Project, type: :model do
  context 'when given correct data' do
    let(:data) do
      {
        title:                  'title',
        description:            'description',
        github_url:             'http://example.com/github',
        my_focus:               'programming',
        code_climate_badge_url: 'http://example.com/code-climate',
        travis_ci_badge_url:    'http://example.com/travis-ci',
        screenshot:             'screenshot',
        production_url:         'http://example.com/production'
      }
    end

    it 'creates a project' do
      result = Project.create(data)

      expect(result).to                        be_valid
      expect(result.title).to                  eq 'title'
      expect(result.description).to            eq 'description'
      expect(result.github_url).to             eq 'http://example.com/github'
      expect(result.my_focus).to               eq 'programming'
      expect(result.code_climate_badge_url).to eq 'http://example.com/code-climate'
      expect(result.travis_ci_badge_url).to    eq 'http://example.com/travis-ci'
      expect(result.screenshot.class).to       eq ScreenshotUploader
      expect(result.production_url).to         eq 'http://example.com/production'
    end

    it 'belongs to a person' do
      person = Person.new
      person.save(validate: false)

      result = Project.create(data.merge(person_id: person.id))

      expect(result.person).not_to be_nil
      expect(result.person).to eq person
    end
  end
end
