require 'rails_helper'

RSpec.describe Project, type: :model do
  context 'when given correct data' do
    let(:data) do
      {
        title:                  'title',
        description:            'description',
        github_url:             'https://example.com/github',
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
      expect(result.github_url).to             eq 'https://example.com/github'
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

  context 'when given bad data' do
    let(:data) do
      {
        title:                  'title',
        description:            'description',
        github_url:             'example.com/github',
        my_focus:               'programming',
        code_climate_badge_url: 'example.com/code-climate',
        travis_ci_badge_url:    'example.com/travis-ci',
        screenshot:             'screenshot',
        production_url:         'example.com/production'
      }
    end

    it 'does not allow invalid urls for github' do
      project = Project.new(data)

      expect(project).not_to  be_valid
      expect(project.errors.messages).to include :github_url
    end
    it 'does allow for an empty github url' do
      project = Project.new(data)
      project.github_url = nil

      expect(project.errors.messages).not_to  include :github_url
    end

    it 'does not allow invalid urls for code climate badge' do
      project = Project.new(data)

      expect(project).not_to  be_valid
      expect(project.errors.messages).to include :code_climate_badge_url
    end
    it 'does allow for an empty code climate badge url' do
      project = Project.new(data)
      project.code_climate_badge_url = nil

      expect(project.errors.messages).not_to  include :code_climate_badge_url
    end

    it 'does not allow invalid urls for travis ci' do
      project = Project.new(data)

      expect(project).not_to  be_valid
      expect(project.errors.messages).to include :travis_ci_badge_url
    end
    it 'does allow for an empty travis ci url' do
      project = Project.new(data)
      project.travis_ci_badge_url = nil

      expect(project.errors.messages).not_to  include :travis_ci_badge_url
    end

    it 'does not allow invalid urls for production' do
      project = Project.new(data)

      expect(project).not_to  be_valid
      expect(project.errors.messages).to include :production_url
    end
    it 'does allow for an empty production url' do
      project = Project.new(data)
      project.production_url = nil

      expect(project.errors.messages).not_to  include :production_url
    end
  end
end
