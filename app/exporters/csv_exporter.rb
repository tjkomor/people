require 'csv'

class CsvExporter
  attr_reader :model

  def initialize(table)
    @model = table.singularize.capitalize.constantize
  end

  def records
    model.all.map { |record| format_record(record) }
  end

  def headers
    model.new.csv_attributes.keys
  end

  def generate_csv
    CSV.generate do |csv|
      csv << headers
      records.each { |record| csv << record }
    end
  end

  def print
    puts generate_csv
  end

  private

  def format_record(record)
    record.csv_attributes.map { |_, value| value }
  end
end
