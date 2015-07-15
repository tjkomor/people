
require 'rails_helper'

RSpec.describe CsvExporter, type: :exporter do
  context 'when given correct data' do
    let(:cohort)    { Cohort.create(name: '1406') }
    let(:location)  { Location.create(name: 'San Francisco, CA') }

    let(:data) do
      {
        first_name:     'Jorge',
        last_name:      'Téllez',
        email_address:  'jorge@example.com',
        github_url:     'http://example.com/github',
        looking_for:    'fun',
        best_at:        'Spanish',
        photo_slug:     'photo',
        hidden:         'false',
        introduction:   'Hello!',
        user_github_id: '1',
        cohort:         cohort,
        locations:      [location]
      }
    end

    it 'has a model to export' do
      result = CsvExporter.new('people')

      expect(result.model).to eq Person
    end

    it 'gets all the records' do
      person = Person.create(data)
      result = CsvExporter.new('people').records

      expect(result.first).to include 'Jorge', 'Téllez'
    end

    it 'gets all the model headers' do
      result = CsvExporter.new('people').headers

      expect(result).to include 'first_name', 'last_name', 'email_address'
    end

    it 'export records into CSV format' do
      person = Person.create(data)
      result = CsvExporter.new('people').generate_csv

      expect(result).to include 'first_name'
      expect(result).to include 'Jorge'
    end
  end
end
