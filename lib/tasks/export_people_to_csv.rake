namespace :csv do
  desc 'Print people data in csv format'
  task print: :environment do
    CsvExporter.new('people').print
  end
end
